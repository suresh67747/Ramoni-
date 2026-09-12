-- RAMONI product image storage foundation for Supabase Storage
-- Create a bucket named `ramoni-products` in Supabase Storage.
-- Recommended object path: products/<product-id>/<filename>

insert into storage.buckets (id, name, public)
values ('ramoni-products', 'ramoni-products', true)
on conflict (id) do nothing;

-- Public catalogue images can be read by everyone.
create policy if not exists "RAMONI product images are publicly readable"
on storage.objects for select
using (bucket_id = 'ramoni-products');

-- Upload/update/delete policies should be tightened to authenticated administrators
-- once Supabase Auth is connected. This file intentionally does not grant anonymous writes.
