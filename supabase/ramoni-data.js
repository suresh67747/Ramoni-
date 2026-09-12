/* RAMONI data access layer
 * Uses the public Supabase client only. RLS remains the security boundary.
 */
(function () {
  const db = () => window.ramoniSupabase;
  const requireDb = () => { if (!db()) throw new Error('Supabase is not configured. Add RAMONI_CONFIG before using cloud data.'); return db(); };

  window.RAMONI_DATA = {
    async listProducts() {
      const { data, error } = await requireDb().from('products').select('*').order('created_at', { ascending: false });
      if (error) throw error;
      return data || [];
    },
    async getProduct(id) {
      const { data, error } = await requireDb().from('products').select('*').eq('id', id).single();
      if (error) throw error;
      return data;
    },
    async createProduct(product) {
      const { data, error } = await requireDb().from('products').insert(product).select().single();
      if (error) throw error;
      return data;
    },
    async updateProduct(id, product) {
      const { data, error } = await requireDb().from('products').update(product).eq('id', id).select().single();
      if (error) throw error;
      return data;
    },
    async deleteProduct(id) {
      const { error } = await requireDb().from('products').delete().eq('id', id);
      if (error) throw error;
    },
    async listCategories() {
      const { data, error } = await requireDb().from('categories').select('*').order('name');
      if (error) throw error;
      return data || [];
    },
    async listBrands() {
      const { data, error } = await requireDb().from('brands').select('*').order('name');
      if (error) throw error;
      return data || [];
    },
    async uploadProductImage(file, productId) {
      const client = requireDb();
      const safeName = String(file.name || 'image').replace(/[^a-zA-Z0-9._-]/g, '-');
      const path = `${productId}/${Date.now()}-${safeName}`;
      const { error: uploadError } = await client.storage.from('ramoni-products').upload(path, file, { upsert: false, contentType: file.type || undefined });
      if (uploadError) throw uploadError;
      const { data } = client.storage.from('ramoni-products').getPublicUrl(path);
      return { path, publicUrl: data.publicUrl };
    }
  };
})();
