# Glossary

| Term | Meaning |
|---|---|
| BIOS | Legacy firmware interface that initializes hardware and starts the boot process |
| UEFI | Modern firmware interface commonly used with GPT and an EFI System Partition |
| Kernel | Core of the operating system responsible for hardware, scheduling, memory, and system calls |
| initramfs | Temporary root filesystem used during early boot |
| systemd | Service manager and init system used by many Linux distributions |
| Unit | A systemd-managed resource such as a service, socket, timer, mount, or target |
| Target | A systemd synchronization point grouping units, conceptually similar to a runlevel |
| Device node | Special file under `/dev` representing a device interface |
| sysfs | Virtual filesystem, normally mounted at `/sys`, exposing kernel devices and attributes |
| udev | Userspace device manager that reacts to kernel device events |
| Partition table | Metadata describing partitions on a block device |
| GPT | GUID Partition Table, a modern partitioning format |
| MBR | Master Boot Record, a legacy partition and boot format |
| Filesystem | Structure used to store and retrieve files on a block device or virtual medium |
| Inode | Filesystem object containing metadata and references to file data |
| Mount point | Directory where a filesystem becomes accessible |
| UUID | Universally unique identifier frequently used for stable filesystem references |
| Package | Distribution-managed collection of software and metadata |
| Repository | Source of packages and metadata used by a package manager |
| Shared library | Reusable compiled code loaded by multiple programs at runtime |
| Shell | Command interpreter such as Bash |
| Environment variable | Named value inherited by child processes |
| Pipeline | Sequence where one command's output becomes another command's input |
| File descriptor | Numeric process handle for an open stream or file; 0, 1, and 2 are stdin, stdout, and stderr |
| Process | Running program instance with an identifier and resources |
| Signal | Asynchronous notification sent to a process |
| Zombie | Exited process whose status has not yet been collected by its parent |
| Nice value | User-visible scheduling priority hint for CPU time |
| Regular expression | Pattern language for matching text |
| Hard link | Additional directory entry referring to the same inode |
| Symbolic link | File containing a path to another file or directory |
| SUID | Permission mode that can execute a file with its owner's effective identity |
| SGID | Permission mode that can affect execution identity or directory group inheritance |
| Sticky bit | Directory permission restricting deletion of entries in shared writable directories |
| FHS | Filesystem Hierarchy Standard defining common directory purposes |
| Locale | Language, territory, encoding, and formatting settings |
| Cron | Recurring job scheduler |
| systemd timer | systemd unit that activates another unit based on time |
| NTP | Network Time Protocol |
| Syslog | Standard family of logging protocols and message formats |
| CIDR | Prefix-length notation for IP networks |
| Default route | Route used when no more-specific route matches |
| Resolver | Component that maps names to addresses using sources such as files and DNS |
| SSH | Secure Shell protocol for encrypted remote access and tunneling |
| Host key | SSH server identity key |
| GnuPG | OpenPGP implementation used for encryption and digital signatures |
| Least privilege | Principle of granting only the permissions needed for a task |
