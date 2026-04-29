# Transaction + concurrency demo

Document a **two-session** demo (for example two `psql` terminals or two clients).

## Isolation / locking notes

MVCC: Session B reads the old committed version while Session A modifies a new version
Isolation: No dirty reads occur
Locking: Session B’s UPDATE blocks until Session A commits
ACID:
Atomicity: transactions complete fully
Consistency: constraints remain valid
Isolation: concurrent transactions are separated
Durability: committed data persists