-- RAMONI production hardening migration
-- Run AFTER database/schema.sql and AFTER database/rls.sql.
-- Safe to re-run.

-- Storage bucket
insert into storage.buckets (id, name, public)
values ('ramoni-products', 'ramoni-products', true)
on conflict (id) do update set public = true;

-- Recreate public-read policy without CREATE POLICY IF NOT EXISTS syntax.
drop policy if exists "RAMONI product images are publicly readable" on storage.objects;
create policy "RAMONI product images are publicly readable"
on storage.objects for select
to public
using (bucket_id = 'ramoni-products');

-- Authenticated administrators can manage files in the RAMONI bucket.
drop policy if exists "Authenticated users manage RAMONI product images" on storage.objects;
create policy "Authenticated users manage RAMONI product images"
on storage.objects for all
to authenticated
using (bucket_id = 'ramoni-products')
with check (bucket_id = 'ramoni-products');

-- Helpful integrity/index layer for production queries.
create index if not exists idx_products_catalogue_enabled on public.products(catalogue_enabled);
create index if not exists idx_products_status on public.products(status);
create index if not exists idx_product_images_product on public.product_images(product_id);
create index if not exists idx_catalogue_items_project on public.catalogue_items(project_id);

-- Product model numbers must remain unique; schema.sql already creates this constraint.
-- This migration intentionally does not alter existing product data.
