-- RAMONI image storage foundation for Supabase Storage.
-- Create a bucket named `product-images` in the Supabase dashboard first.

insert into storage.buckets (id, name, public)
values ('product-images', 'product-images', true)
on conflict (id) do update set public = excluded.public;

-- Public read access for catalogue images.
create policy if not exists "Public product image read"
on storage.objects for select
to public
using (bucket_id = 'product-images');

-- Authenticated administrators may upload/update/delete images.
create policy if not exists "Authenticated product image insert"
on storage.objects for insert
to authenticated
with check (bucket_id = 'product-images');

create policy if not exists "Authenticated product image update"
on storage.objects for update
to authenticated
using (bucket_id = 'product-images')
with check (bucket_id = 'product-images');

create policy if not exists "Authenticated product image delete"
on storage.objects for delete
to authenticated
using (bucket_id = 'product-images');
