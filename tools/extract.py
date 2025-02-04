import re
import json
import sys

def find_matching_paren_block(text, start_index):
    """
    Given 'text' and the index of the first '(',
    return the index of the corresponding closing parenthesis
    (handling nested parentheses).
    If not found or unbalanced, return -1.
    """
    if start_index < 0 or start_index >= len(text) or text[start_index] != '(':
        return -1

    depth = 0
    for i, ch in enumerate(text[start_index:], start=start_index):
        if ch == '(':
            depth += 1
        elif ch == ')':
            depth -= 1
            if depth == 0:
                return i
    return -1  # unbalanced / no matching parent

def parse_maxscript_file(filepath):
    """
    Reads a file from 'filepath' and returns a list of parsed results in the form:
    [
        {
            "id": <str>,
            "code": <str>
        },
        ...
    ]
    """
    # Read entire file
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Regex to capture:
    # 1) Function name right up to the opening '('
    # (We stop before '(' so we can do a balanced parentheses match ourselves.)
    pattern = re.compile(
        r'\s*fn\s+(\w+)\s*=\s*\(',  # capture function name
        re.DOTALL
    )

    results = []
    search_pos = 0

    while True:
        match = pattern.search(content, search_pos)
        if not match:
            break

        fn_name = match.group(1).strip()  # function name

        # Index of the '(' right after the function name
        open_paren_index = match.end() - 1

        # Balanced parentheses search
        close_paren_index = find_matching_paren_block(content, open_paren_index)
        if close_paren_index == -1:
            # Unbalanced or not found; skip or handle error
            search_pos = match.end()
            continue

        snippet_start = match.start()             # where the function starts
        snippet_end = close_paren_index + 1       # one past the matching ')'
        code_snippet = content[snippet_start:snippet_end].strip()

        # Generate the id based on the function name
        func_id = fn_name.replace('fn ', '')

        results.append({
            "id": func_id,
            "code": code_snippet
        })

        search_pos = snippet_end  # move on

    return results

def main():
    if len(sys.argv) < 2:
        print("Usage: python extract.py <file_path>")
        sys.exit(1)

    file_path = sys.argv[1]
    parsed_results = parse_maxscript_file(file_path)
    print(json.dumps(parsed_results, indent=4))

if __name__ == '__main__':
    main()