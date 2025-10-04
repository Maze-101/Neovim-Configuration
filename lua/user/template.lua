-- lua/user/templates.lua
-- This file handles automatically inserting templates into new files.

-- Define your C++ competitive programming template as a table of strings
local cpp_template = {
  '#include <bits/stdc++.h>',
  '#include <ext/pb_ds/assoc_container.hpp>',
  '#include <climits>',
  '#define e "\\n"',
  '#define sp " "',
  '#define all(bruh) bruh.begin(),bruh.end()',
  '#define rall(bruh) bruh.rbegin(), bruh.rend()',
  '#define loop(i, st, end) for (ll i = st; i < end; i++)',
  '#define getVec(arr, size)   \\',
  '    vector<ll> arr(size);  \\',
  '    for (auto &input : arr) cin >> input;',
  '#define print(bruh, n)                                            \\',
  '    for (int i = 0; (n && i < n) || (!n && i < bruh.size()); i++) \\',
  '    cout << bruh[i] << \' \';                                   \\',
  '    cout << endl;',
  '#define sz(a) a.size()',
  '#define mine(bruh) *min_element(bruh.begin(), bruh.end())',
  '#define maxe(bruh) *max_element(bruh.begin(), bruh.end())',
  '#define YES cout << "YES" << e',
  '#define NO cout << "NO" << e',
  '#define mid_of_binary_search (l + (r - l) / 2)',
  '#define SHIKIGAMI {ios_base::sync_with_stdio(false); cin.tie(nullptr); cout.tie(nullptr);}',
  'using namespace __gnu_pbds;',
  'using namespace std;',
  'template <typename T>',
  'using ordered_set = tree<',
  '    T,',
  '    null_type,',
  '    less<T>,',
  '    rb_tree_tag,',
  '    tree_order_statistics_node_update>;',
  '/// 0-based index: find_by_order(k) returns iterator to k-th element',
  '/// order_of_key(x): number of elements < x',
  '',
  'typedef string str;',
  'typedef long long ll;',
  'typedef long double ld;',
  'typedef pair<ll,ll> pll;',
  'typedef vector<pll> vpll;',
  'typedef vector <long long> vll;',
  'typedef vector <vector<ll>> v2ll;',
  'typedef vector <vector<char>> v2c;',
  'const ll INF = 1e18;',
  '',
  'void solve(){',
  '    ',
  '}',
  '',
  'int main(){',
  '    SHIKIGAMI',
  '    int t = 1;',
  '    // cin >> t;',
  '    while(t--){',
  '        solve();',
  '    }',
  '    return 0;',
  '}',
}

-- Create an autocommand that runs when a new C++ file is created
local template_group = vim.api.nvim_create_augroup("UserTemplates", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
  group = template_group,
  pattern = "*.cpp,*.cxx,*.cc", -- File extensions to trigger on
  callback = function()
    -- Insert the template lines
    vim.api.nvim_buf_set_lines(0, 0, -1, false, cpp_template)

    -- Move the cursor to the inside of the solve() function
    vim.api.nvim_win_set_cursor(0, {52, 4})
  end,
})
