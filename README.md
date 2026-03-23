# IA510 MP4 — Transactions + Concurrency

## AI use (course policy)

**Allowed:** explain concepts, approaches, starter snippets, SQL suggestions, README help.

**Required:** frequent commits, this `AI_Usage.md` file, and verification (SQL output, screenshots, or runs).

**Not allowed:** submitting work you do not understand, fabricating evidence, or copying another student's repository.

## Grading: pytest vs rubric

- **pytest** in GitHub Actions is a **pass/fail gate** (does it run, are basic contracts met). It is **not** mapped to rubric point rows.
- Your **instructor assigns the 10 points** using the rubric below.

**Org Actions:** If GitHub Actions are disabled on student repositories in this organization, run the same checks locally: `docker compose up -d` then `pytest -q` (see README). The rubric still applies.


## Goal

Demonstrate and explain transaction behavior with a reproducible two-session example.

## Deliverables

- `setup.sql`
- `demo_steps.md` (must mention isolation/locking/MVCC/transaction/ACID themes)
- `evidence/sessionA.txt` and `evidence/sessionB.txt`
- `AI_Usage.md`

## Verify locally

```bash
docker compose up -d
pip install -r requirements-dev.txt
export PGHOST=localhost PGPORT=5432 PGDATABASE=ia510 PGUSER=ia510_user PGPASSWORD=ia510_pass
pytest -q
docker compose down -v
```

## Rubric (10 points)

| Criteria | Excellent | Good | Satisfactory | Needs Improvement | Pts |
| --- | --- | --- | --- | --- | --- |
| Working demo | Clear 2-session demo; reproducible | Mostly reproducible; minor confusion | Partially works | Not working | 6 |
| Concept explanation | ACID/MVCC/isolation accurate | Mostly accurate | Surface-level | Incorrect | 2 |
| Steps + evidence + AI log | Commands + outputs/screens; strong AI_Usage | Adequate | Minimal | Missing | 2 |

