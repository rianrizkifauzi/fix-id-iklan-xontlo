import re

with open(r'D:\Joki Coding\fix-id-iklan\FixAd.sh', 'r', encoding='utf-8') as f:
    content = f.read()

# Parse variable assignments
vars_dict = {}
parts = content.split('eval ')[0]
for part in parts.split(';'):
    part = part.strip()
    m = re.match(r"([A-Za-z_]\w*)='(.*?)'", part)
    if m:
        name = m.group(1)
        val = m.group(2)
        vars_dict[name] = val

# Get eval string
eval_match = re.search(r'eval "(.*)"', content, re.DOTALL)
if eval_match:
    eval_str = eval_match.group(1)
    
    # Replace variable refs $VarName
    sorted_keys = sorted(vars_dict.keys(), key=len, reverse=True)
    result = eval_str
    for key in sorted_keys:
        result = result.replace('$' + key, vars_dict[key])
    
    # Clean up shell escapes
    result = result.replace("'\\''", "'")
    
    print('=== DEOBFUSCATED SCRIPT ===')
    print(result)
    
    with open(r'D:\Joki Coding\fix-id-iklan\FixAd_decoded.sh', 'w') as f:
        f.write(result)
    print('\nSaved to FixAd_decoded.sh')
