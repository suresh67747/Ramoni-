# RAMONI Product Import Mapping

Source workbook: `Rajeshwar_Product_Data_CATEGORY_WISE_FINAL(1).xlsx`

## Source data
The workbook contains a cleaned master with about 1,804 product lines, plus a richer `FULL ENTRY` sheet with 35 catalogue fields.

## RAMONI product fields
| Excel field | RAMONI field |
|---|---|
| Product Code | model_no |
| Product Name / Standard Product Name | name |
| Category | category |
| Sub Category | sub_category |
| Product Type | product_type |
| Brand / Make | brand |
| Colour | colour |
| Material | material |
| Finish | finish |
| Size / Dimensions | size |
| Length (mm) | length_mm |
| Width (mm) | width_mm |
| Height (mm) | height_mm |
| Weight (g) | weight_g |
| Pack Qty | pack_qty |
| MRP (₹) | mrp |
| Selling Price (₹) | selling_price |
| GST % | gst_percent |
| HSN Code | hsn_code |
| Stock Qty | stock_qty |
| Unit | unit |
| Status | status |
| Short Description | short_description |
| Feature 1-3 | features |
| Detailed Description | description |
| Main Image | main_image |
| Image 2-5 | additional_images |
| Video Link | video_link |
| Amazon ASIN | amazon_asin |
| Notes | notes |

## Import rules
1. `FULL ENTRY` is the preferred source for the production import because it already contains the catalogue-oriented fields.
2. Category and sub-category values are preserved from the workbook; the importer should create missing categories/sub-categories when the user confirms import.
3. Product code/model number should be unique. Duplicate model numbers must be shown in the preview and never silently overwrite an existing product.
4. Blank optional fields remain blank.
5. Stock quantity is retained as inventory information but does not control catalogue visibility.
6. `Status` defaults to `active` when blank after import validation.
7. Catalogue visibility is controlled separately by the RAMONI catalogue flag.
8. Image columns are treated as filenames/URLs. Actual image files can be uploaded later and matched by filename/model number.
9. The `DUPLICATE REVIEW` sheet must not be imported automatically; it is a review list.
10. The importer must show a preview, validation errors, duplicate warnings and final import count before writing to Supabase.
