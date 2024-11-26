# Training Day 1

## 1. Viewing System Configuration

To view the system configuration, use the command:

```powershell
$PSVersionTable
```

The output is as follows:

```plaintext
Name                           Value
----                           -----
PSVersion                      7.3.6
PSEdition                      Core
GitCommitId                    7.3.6
OS                             Linux 5.4.0-1058-azure #60~18.04.1-Ubuntu SMP Tue Aug 31 20:34:4…
Platform                       Unix
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
WSManStackVersion              3.0
```

To view only the PowerShell version configuration, access it via:

```powershell
$PSVersionTable.PSVersion
```

The output is:

```plaintext
Major  Minor  Patch  PreReleaseLabel BuildLabel
-----  -----  -----  --------------- ----------
7      3      6
```

---

## Cmdlets

A cmdlet is a compiled command. It can be developed in .NET or .NET Core and invoked as a command from PowerShell. PowerShell includes thousands of cmdlets. The challenge lies in discovering what cmdlets exist and what they can do.

Cmdlet names follow a **verb-noun** naming pattern, which helps users understand their purpose and find them. This pattern also ensures consistent naming by developers. Use the `Get-Verb` cmdlet to view the list of approved verbs, which are organised by activity and function.

Here is a partial output of running `Get-Verb`:

- **Get-Command**: Lists all available cmdlets on the system. Filter the list to quickly find the command you need.
- **Get-Help**: Invokes an integrated help system. The `help` alias provides a paginated response for a better reading experience.
- **Get-Member**: When you call a command, the response is an object with many properties. Use `Get-Member` to delve into the response and understand it better.

Running `Get-Command` in **Cloud Shell** provides a list of all installed commands in PowerShell. Since thousands of commands are installed, filtering the response is essential for locating the needed command.

To filter the list, follow the verb-noun naming standard for cmdlets. For example, in the command `Get-Random`, `Get` is the verb, and `Random` is the noun. Use flags to target the verb or noun. These flags accept string values, and you can use pattern-matching characters to refine the search.

### Examples of Using Flags to Filter Commands:

- **-Noun**: Targets the noun part of the command name. For example:

```powershell
Get-Command -Noun alias*
```

- **-Verb**: Targets the verb part of the command name. Combine `-Noun` and `-Verb` for more specific queries. For example:

```powershell
Get-Command -Verb Get -Noun alias*
```

---

## Activity

In this scenario, search for a cmdlet to work with files.

1. Run the `Get-Command` with the `-Noun` flag. Specify `File*` to find commands related to files:

```powershell
Get-Command -Noun File*
```

The output is:

```plaintext
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Get-FileHash                                       7.0.0.0    Microsoft.PowerShell.Utility
Cmdlet          Out-File                                           7.0.0.0    Microsoft.PowerShell.Utility
Cmdlet          Unblock-File                                       7.0.0.0    Microsoft.PowerShell.Utility
```

2. Use both `-Verb` and `-Noun` flags:

```powershell
Get-Command -Verb Get -Noun File*
```

The output is:

```plaintext
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Get-FileHash                                       7.0.0.0    Microsoft.PowerShell.Utility
```

---

## Activity

Your organisation is starting to create resources in Azure without a standardised workflow. There have been incidents of critical resources being accidentally deleted, and it is challenging to identify resource ownership.

You must use **resource groups** to organise Azure resources for the organisation.

---

## Execution Policy

The PowerShell execution policy controls the conditions under which PowerShell scripts can run. It is a security feature designed to prevent the unintentional execution of malicious scripts. However, it is not a security boundary since determined users can bypass the policy.

Execution policies can be set for:

- The local computer
- The current user
- A PowerShell session

Policies can also be enforced via Group Policy for users and computers. The default execution policy for current Windows operating systems is shown below.

---

# Task 1

Write a PowerShell script that lists all running processes and generates a log file with their status.

#Task 2

Configure a PowerShell script to restart specific services (e.g. web server or database).
