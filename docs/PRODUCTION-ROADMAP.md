# RAMONI Catalogue Manager — Production Roadmap

## Phase 1 — Admin foundation
- [x] Screenshot-inspired professional dashboard
- [x] Product master UI
- [x] Product add/edit/search/filter foundation
- [x] Categories, brands, price list and catalogue workspaces
- [x] Responsive layout

## Phase 2 — Real data layer
- [ ] Supabase project connection
- [ ] Authentication and administrator access
- [ ] PostgreSQL product/category/brand schema
- [ ] Supabase Storage for product images
- [ ] Image upload, primary image and gallery ordering
- [ ] Server-side search, filters and pagination

## Phase 3 — Bulk catalogue operations
- [ ] Excel/CSV import wizard
- [ ] Column mapping and validation
- [ ] Duplicate model/SKU detection
- [ ] Bulk image matching by model number / SKU
- [ ] Import preview, error report and retry
- [ ] Export product master

## Phase 4 — Catalogue Builder
- [ ] Select all / category / selected products
- [ ] Drag-and-drop ordering
- [ ] Cover and company introduction
- [ ] Category divider pages
- [ ] Professional product specification pages
- [ ] MRP / selling price controls
- [ ] Preview before publishing

## Phase 5 — Publishing
- [ ] High-resolution PDF generation
- [ ] WhatsApp/share workflow
- [ ] Published catalogue history and versions
- [ ] Public catalogue URL
- [ ] Own RAMONI domain deployment

## Quality gates
- No RUHE India dependency
- Real RAMONI product data and images only when supplied/imported
- Required product fields validated before catalogue publishing
- Database-backed data, not browser localStorage, for production
- Mobile and desktop responsive UI
- Error states and success notifications throughout the application
