# RAMONI Catalogue Manager

Independent product catalogue management software for RAMONI.

## What is included now
- Professional admin dashboard inspired by the approved RAMONI layout
- Product master with add/edit/search/filter foundation
- Required product data model: model no., name, category, brand, size, material, finish, MRP, selling price, description, features and catalogue status
- Multi-image storage data model and Supabase Storage policies
- Categories, brands, price list and catalogue builder workspaces
- Responsive desktop/mobile layout
- Bulk Excel/CSV import template with image filename matching
- PostgreSQL/Supabase schema for products, images and catalogue projects
- Safe environment variable template
- Production roadmap and quality gates

## Production setup
1. Create a Supabase project.
2. Run `database/schema.sql` in the Supabase SQL editor.
3. Run `supabase/storage-policies.sql` after enabling the `product-images` bucket policy setup.
4. Configure the public client values from `.env.example` in the deployment environment.
5. Use `data/products-import-template.csv` as the starting format for bulk imports.
6. Deploy the web application to a production host and configure the application URL.

## Bulk import format
The import template is designed for large catalogues. `model_no` is the stable product identifier and `image_filename` is the intended image-matching key. A production importer should validate required fields, detect duplicate model numbers, preview changes, report row-level errors, and only commit validated rows.

## Catalogue publishing
The production catalogue flow is planned around selecting products, arranging order, adding cover/company/category pages, previewing the result, and generating a high-resolution PDF. Publishing should only use validated active products.

## Security
- Never commit real Supabase secrets or service-role keys.
- Browser clients must use only the public/anon key with database policies enforced.
- Administrative writes should require authenticated access.

This repository is independent of RUHE India and is intended only for the RAMONI project.
