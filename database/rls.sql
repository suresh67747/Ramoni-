-- RAMONI production Row Level Security
-- Run after database/schema.sql.
-- Public catalogue data is readable; admin mutations require an authenticated Supabase user.

alter table public.categories enable row level security;
alter table public.brands enable row level security;
alter table public.products enable row level security;
alter table public.product_images enable row level security;
alter table public.catalogue_projects enable row level security;
alter table public.catalogue_items enable row level security;

drop policy if exists "Public can read categories" on public.categories;
create policy "Public can read categories" on public.categories for select using (true);

drop policy if exists "Authenticated users manage categories" on public.categories;
create policy "Authenticated users manage categories" on public.categories for all to authenticated using (true) with check (true);

drop policy if exists "Public can read brands" on public.brands;
create policy "Public can read brands" on public.brands for select using (true);

drop policy if exists "Authenticated users manage brands" on public.brands;
create policy "Authenticated users manage brands" on public.brands for all to authenticated using (true) with check (true);

drop policy if exists "Public can read catalogue products" on public.products;
create policy "Public can read catalogue products" on public.products for select using (catalogue_enabled = true and status = 'active');

drop policy if exists "Authenticated users manage products" on public.products;
create policy "Authenticated users manage products" on public.products for all to authenticated using (true) with check (true);

drop policy if exists "Public can read product images" on public.product_images;
create policy "Public can read product images" on public.product_images for select using (true);

drop policy if exists "Authenticated users manage product images" on public.product_images;
create policy "Authenticated users manage product images" on public.product_images for all to authenticated using (true) with check (true);

drop policy if exists "Authenticated users manage catalogue projects" on public.catalogue_projects;
create policy "Authenticated users manage catalogue projects" on public.catalogue_projects for all to authenticated using (true) with check (true);

drop policy if exists "Authenticated users manage catalogue items" on public.catalogue_items;
create policy "Authenticated users manage catalogue items" on public.catalogue_items for all to authenticated using (true) with check (true);
