-- RAMONI Catalogue Manager - production database foundation
-- Designed for Supabase / PostgreSQL

create extension if not exists pgcrypto;

create table if not exists categories (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  slug text not null unique,
  description text,
  created_at timestamptz not null default now()
);

create table if not exists brands (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  logo_url text,
  created_at timestamptz not null default now()
);

create table if not exists products (
  id uuid primary key default gen_random_uuid(),
  model_no text not null unique,
  name text not null,
  category_id uuid references categories(id) on delete set null,
  brand_id uuid references brands(id) on delete set null,
  size text,
  material text,
  finish text,
  mrp numeric(12,2),
  selling_price numeric(12,2),
  description text,
  features jsonb not null default '[]'::jsonb,
  status text not null default 'active' check (status in ('active','draft','archived')),
  catalogue_enabled boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists product_images (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references products(id) on delete cascade,
  storage_path text not null,
  image_url text,
  sort_order integer not null default 0,
  is_primary boolean not null default false,
  created_at timestamptz not null default now()
);

create table if not exists catalogue_projects (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text,
  status text not null default 'draft' check (status in ('draft','published','archived')),
  cover_title text,
  cover_subtitle text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists catalogue_items (
  id uuid primary key default gen_random_uuid(),
  catalogue_id uuid not null references catalogue_projects(id) on delete cascade,
  product_id uuid not null references products(id) on delete cascade,
  sort_order integer not null default 0,
  unique(catalogue_id, product_id)
);

create index if not exists products_category_idx on products(category_id);
create index if not exists products_brand_idx on products(brand_id);
create index if not exists products_status_idx on products(status);
create index if not exists product_images_product_idx on product_images(product_id);
create index if not exists catalogue_items_catalogue_idx on catalogue_items(catalogue_id);

insert into categories(name, slug) values
  ('Faucets','faucets'), ('Sanitaryware','sanitaryware'), ('Showers','showers'),
  ('Accessories','accessories'), ('Kitchen','kitchen')
on conflict (name) do nothing;

insert into brands(name) values ('RAMONI') on conflict (name) do nothing;
