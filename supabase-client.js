/* RAMONI Supabase client
 * Configure these values through window.RAMONI_CONFIG before loading this file.
 * Never place a Supabase secret/service-role key here.
 */
(function () {
  const config = window.RAMONI_CONFIG || {};
  const url = config.supabaseUrl || '';
  const key = config.supabasePublishableKey || '';
  if (!url || !key || !window.supabase) {
    console.warn('RAMONI Supabase is not configured yet.');
    window.ramoniSupabase = null;
    return;
  }
  window.ramoniSupabase = window.supabase.createClient(url, key);
})();
