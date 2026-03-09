import sqlite3
import os

def init_db(conn):
    with open('schema.sql', 'r') as f:
        content = f.read()
    conn.cursor().executescript(content)
    with open('seed.sql', 'r') as f:
        content = f.read()
    conn.cursor().executescript(content)
    conn.commit()

def run_query(conn, filepath):
    with open(filepath, 'r') as f:
        content = f.read()
    cursor = conn.cursor()
    cursor.execute(content)
    rows = cursor.fetchall()
    columns = [desc[0] for desc in cursor.description]
    return columns, rows


def print_report(title, columns, rows):
    col_widths = [len(col) for col in columns]
    for row in rows:
        for i, val in enumerate(row):
            col_widths[i] = max(col_widths[i], len(str(val)))

    print('=' * 40)
    print(f'{title}')
    print('=' * 40)
    print(' | '.join(col.ljust(col_widths[i]) for i, col in enumerate(columns)))
    print('-' * 40)
    for row in rows:
        print(' | '.join(str(val).ljust(col_widths[i]) for i, val in enumerate(row)))

def main():
    if os.path.exists('database.db'):
        os.remove('database.db')
    conn = sqlite3.connect('database.db')
    init_db(conn)
    columns, rows = run_query(conn, 'queries/01_joins.sql')
    print_report('Joins', columns, rows)
    columns, rows = run_query(conn, 'queries/02_aggregations.sql')
    print_report('Aggregations', columns, rows)
    columns, rows = run_query(conn, 'queries/03_subqueries.sql')
    print_report('Subqueries', columns, rows)
    columns, rows = run_query(conn, 'queries/04_window_functions.sql')
    print_report('Window Functions', columns, rows)
    columns, rows = run_query(conn, 'queries/05_lag.sql')
    print_report('Lag', columns, rows)
    columns, rows = run_query(conn, 'queries/06_row_number.sql')
    print_report('Row Number', columns, rows)
    columns, rows = run_query(conn, 'queries/07_cte.sql')
    print_report('CTE', columns, rows)
    columns, rows = run_query(conn, 'queries/08_best_customer.sql')
    print_report('Best Customer', columns, rows)
    conn.close()

if __name__ == '__main__':
    main()