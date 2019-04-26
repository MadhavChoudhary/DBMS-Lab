## Implementation of 2-Phase-Locking

### Instructions
```
g++ 2PL.ccp
./a.out < test.txt
```

### Working
1. The transaction schedule is taken as input from test.txt
2. Initially all the locks unset and request table is empty.
3. When a transaction does read/write on an object, an exclusive read and at least a shared right lock is given to that transaction on that object and the operation is allowed to be done.
4. If a transaction, tries to access an object with an exclusive lock of some other transaction, it will raise a conflict and keep the transaction on hold (added to request table).
5. When a transaction is committed, all the associated locks are released and the transactions in request table are tried. They follow the same procedure as previously discussed.  

**Note**: To Avoid Deadlocks in output schedule, which is an extra feature (not under assignment), exclusive reads have been prefered instead of shared reads in some places.