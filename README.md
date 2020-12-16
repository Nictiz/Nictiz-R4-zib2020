# Nictiz-R4-Zib2020

This repository contains HL7 FHIR R4 compliant profiles and related conformance materials for the Release 2020 of the Dutch [zibs](https://zibs.nl/wiki/Zorginformatiebouwstenen) (_Zorginformatiebouwstenen_, i.e. Clinical Information Models, also known as Clinical Building Blocks or Health and Care Information Models).

This repository is maintained by the Dutch National Intitute for ICT in Healthcare (Nictiz).

## Git workflow

### Branching strategy

There may be multiple stable branches being maintained simultaneously, identified by the 'stable-x' names. This branch corresponds to the HL7 FHIR package that gets published.

Nictiz uses the following branching strategy for development:

* Releases correspond with the "stable-xxx" branches. These branches are only updated when there is a new release.
* Integration of fixes and features is done on integration branches, called "release-xxx", where "xxx" is the version number of the upcoming release. Integration branches are created for each new release cycle and deleted after they are merged to the "stable-xxx" branches.
* Development of fixes and features is done:
  * Hotfixes (typo's etc.) are usually directly applied on the integration branch(es).
  * Larger issues are developed in topic branches. These issues are usually tracked in [BITS](https://bits.nictiz.nl) and the topic branches are called accordingly. Topic branches are merged into the integration branches when they are ready to be released. They are deleted after they are merged to all relevant integration branches.

The following illustration visualizes how this workflow might look like

```
stable-1.x
--x--x-----------------x------------+--x-----------------
  |  |                 |            |  |
  |  | release-1.3.5   |            |  | release-1.3.6
  |  \--------------+--|------------/  \-----+-----------
  |                 |  |                     |
  | MM-1024         |  | MM-2048             |
  \-----------------/  \--\------------------/
                          |
stable-2.x                |
-----x---x----------------|----+--x----------------------
     |   |                |    |  |
     |   | release-2.0.1  |    |  | release-2.0.2
     |   \------------+---+----/  \----------------------
     |                |
     | MM-4096        |
     \----------------/
```

Things to note:

* Major versions might have independent life cycles. For example, the release cycle for 2.0.1 starts and ends at a different point in time than the release cycle for 1.3.5.
* Topic branches may be relevant for a single major version (MM-1024, MM-4096) or both major versions (MM-2048). For a merge to the "non-native" branch, cherry-picking or (preferably) a `rebase --onto` is required (for example: `git rebase --onto release-2.0.1 stable-1.x MM-2048` before merging MM-2048 into release-2.0.1).
* Topic branches may have a life cycle independent from the releases (MM-2048).
