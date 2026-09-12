-- RAMONI product image storage foundation for Supabase Storage
-- Creates a public bucket for catalogue images.
-- Recommended object path: products/<product-id>/<filename>

insert into storage.buckets (id, name, public)
values ('ramoni-products', 'ramoni-products', true)
on conflict (id) do nothing;

-- Public catalogue images can be read by everyone.
-- PostgreSQL/Supabase does not support CREATE POLICY IF NOT EXISTS,
-- so remove the old policy first and recreate it safely.
drop policy if exists "RAMONI product images are publicly readable" on storage.objects;

create policy "RAMONI product images are publicly readable"
on storage.objects
for select
to public
using (bucket_id = 'ramoni-products');

-- Upload/update/delete policies will be restricted to authenticated
-- administrators when Supabase Auth is connected. This script intentionally
-- does not grant anonymous write access.
