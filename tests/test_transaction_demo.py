import pathlib


def _exec_script(conn, path: pathlib.Path) -> None:
    text = path.read_text(encoding="utf-8")
    with conn.cursor() as cur:
        for raw in text.split(";"):
            lines = [
                ln
                for ln in raw.splitlines()
                if ln.strip() and not ln.strip().startswith("--")
            ]
            stmt = "\n".join(lines).strip()
            if stmt:
                cur.execute(stmt)


def test_setup_sql_runs(db_conn):
    p = pathlib.Path(__file__).resolve().parents[1] / "setup.sql"
    _exec_script(db_conn, p)


def test_demo_steps_keywords():
    p = pathlib.Path(__file__).resolve().parents[1] / "demo_steps.md"
    text = p.read_text(encoding="utf-8").lower()
    assert "session" in text
    assert any(k in text for k in ("isolation", "lock", "mvcc", "transaction", "acid"))


def test_evidence_files_exist():
    root = pathlib.Path(__file__).resolve().parents[1] / "evidence"
    assert (root / "sessionA.txt").is_file()
    assert (root / "sessionB.txt").is_file()
