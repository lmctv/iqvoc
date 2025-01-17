## [4.x.x] unreleased version

* add config option to disable creating reverse matches for concept mappings
* Drop Ruby 2.5 support (official support ended on 2021-03-31)

## [4.13.0]

* Switch to Bootstrap v4
* Added: extend users with comments field for admins and login metadata records (login_count, failed_login etc)
* upgrade to Rails v5.2
* Ruby 2.6 and Ruby 2.7 compatibility
* Drop Ruby 2.4 support (official support ended on 2020-03-31)
* Drop sprockets in favour of [faucet-pipeline](faucet-pipeline.org/)

## [4.12.2]

* add explicit note positioning
* upgrade dependencies

## [4.12.1]

* drop Ruby 2.2 support (official support ended on 2018-03-31)
* updated to latest Rails patch release (v4.2.11.1)

## [4.12.0]

  * Added: search for concepts by change notes date ranges (#369)
  * Added: group dashboard entries by type (concepts/collections)
  * Added: always visible sidebar (sticky positioning)
  * Added: new designed navbar for logged in users
  * Fixed: Turtle/N-Triples encoding issues in rdf browser serialisation
  * Fixed: several UI glitches (word wraps)
  * Fixed: some wrong link for published/unpublished concepts and labels
  * Ruby 2.4 compatibility
  * drop Ruby 2.0 support (official support ended on 2016-02-24)
  * drop Ruby 2.1 support (official support ended on 2016-03-31)

## [4.11.1]

  * Fixed: duplicate concept collection assignment on concept creation when assigning concept matches
  * Fixed: sprockets deprecations

## [4.11.0]

  * Added: render additional concept info in remote alphabetical search results (federated concept mapper)
  * Fixed: duplicate concept collection assignment bug
  * Fixed: optimize label search in concept creation/editing (contains)
  * Fixed: some things related to reverse-matches mirroring
  * Fixed: initial created change note creation

## [4.10.0]

  * Fixed: several bugs (i18n, sorting)
  * Fixed: several UI glitches

## [4.9.0]

  * Added: updated to latest Rails release (v4.2.4)
  * Added: pagination for parentless concepts
  * Added: onebox search optimizations
  * Added: Assign collections during concept creation
  * Added: Treeview optimizations
  * Fixed: Rescue Importer exceptions
  * Fixed: Keep collections during editing
  * Fixed: multiple matches bug ([#345](https://github.com/innoq/iqvoc/issues/345))
  * Fixed: exclusive label validation ([#340](https://github.com/innoq/iqvoc/issues/340))

## [4.8.2]

  * Changed: We're now using [bower](http://bower.io/) for managing third
    party frontend dependencies
  * Changed: Sign-out link now shows the current user's name
  * Fixed: Status labels in dashboard
  * Fixed: Several permission checks
  * Fixed: UI glitches

## [4.8.1]

  * Changed: New, responsive datepicker
  * Fixed: Several UI glitches

## [4.8.0]

  * Added: Rails 4.2
  * Added: Foreign key constraints
  * Changed: `Iqvoc::Origin` is now `Origin` and generates a random value,
    filter support has been dropped
  * Changed: Reorganized internal library code under ./app, now gets autoloaded
  * Improved: Support for PostgreSQL
  * Fixed: [App template](https://github.com/innoq/iqvoc/wiki/iQvoc-as-a-Rails-Engine#starting-a-new-app) for engine usage

## [4.7.0]

  * Added: Fira Sans as main UI font
  * Added: Concept teasers in hierarchical view
  * Bugfixes

## [4.6.1]

We're planning to release 4.7.0 shortly after this patch release:

  * Fixed: users were prevented from logging in
  * Fixed: collections lost their concepts after saving
  * Fixed: search for notes didn't yield results when filtered for a certain
    collection
  * Fixed: right click was disabled on tree elements
  * Fixed: several visual glitches in date pickers and autocomplete lists
  * Bugfixes

## [4.6.0]

  * [Reverse matches](https://github.com/innoq/iqvoc/wiki/Interconnecting-iQvoc#reverse-matches)
  * Bugfixes

## [4.5.2]

Another patch release before 4.6.0.

  * Bugfixes

## [4.5.1]

  * Fix hierarchical collection view
  * Some minor improvements

## [4.5.0]

4.5.0 brings drag'n'drop concept editing capabilities and a new hierarchical
concept draft view. Browse your thesaurus an see where new concepts version
exists.

  * Add hierarchical draft view with new concept versions
  * Drag'n'Drop support for moving and copying concepts inside hierarchies
  * Minor bugfixes

## [4.4.0]

  * [Asynchronous](https://github.com/innoq/iqvoc#background-jobs) SKOS exporter
  * Improved web based SKOS importer
  * Versioning for collections
  * Concepts, collections and concept scheme can be serialized as NTriples
  * Rails 4.1
  * Bootstrap 3
  * Heroku improvements
  * Improved thesaurus reset
  * Fix import of large RDF graphs

## [4.3.2]

  * Fix non-working migrations on MySQL >= 5.6
  * Fix RDF/XML representation for federated search results

## [4.3.1]

  * Fix for 4.3.0 not booting on heroku

## [4.3.0]

4.3.0 brings federation capabilities as a big new feature! You can search
through connected iQvoc instances as well as get search-as-you-type suggestions
for matches to concepts in connected thesauri. Find out more in the
[wiki](https://github.com/innoq/iqvoc/wiki/Interconnecting-iQvoc).

  * Federated search
  * Federated matches
  * REST API documentation available under [/apidoc](http://try.iqvoc.net/apidoc)
  * Web based ntriples importer now runs
    [asynchronously](https://github.com/innoq/iqvoc#background-jobs) and
    allows for optional publishing
  * Hi-Res UI graphics throughout

## [4.2.0]

As 5.0.0 has been postponed, 4.2.0 comes as another 4.x release.

* Rails 4
* Unbounded hierarchy API depth (853883668977a85d29b30b4e2654f2f53094cae6)
* Collection notes are now configurable
* HTML titles throughout the app
* Bugfixes

## [4.1.3]

This version is intended as the last minor/patch release before version 5.0.0 -
that will incorporate significant overhauls of both internal and external APIs
as well as more sophisticated RDF processing.

  * Improved instance configuration UI
  * Adjusted internal name of note languages setting for consistency
  * Updated Bootstrap
  * Introduced Navigation API<br />
    iQvoc extensions can be injected into the main navigation either at root
    level or in a separate group
  * Removed duplicate results from search when concepts had unpublished versions

## [4.1.2]

  * Dumped Jbuilder (introduced in 4.1.1) to fix endless recursions happening in
    hierarchical views

## [4.1.1]

  * Removed duplicate triples from RDF export
  * Preliminary support for localized note annotations and rdfs:seeAlso
  * Bugfixes

## [4.1.0]

  * Concepts hierarchy API (/hierarchy)
  * Support for SKOS notations
  * Adjusted RDF serializations to always include related concepts' pref. labels
  * Fixed MIME type for RDF/XML
  * Editable concept scheme
  * Ruby 2.0 compatibility
  * Dropped support for Ruby 1.8
  * Heroku Cedar support
  * Bugfixes

## [4.0.9]

  * Speed improvements in SKOS importer
  * Preferred labels are now required to be unique
  * Improved handling of a potential "none" language
  * Bugfixes in application template
  * Improved handling of complex comma separated values
  * New view for expired concepts
  * Internal overhaul for collections
  * Lots of bugfixes and improvements throughout

## [4.0.8]

  * Portugese and spanish UI translations (@nitaibezerra)
  * [FIX] Versioning of concepts did not work
  * Bugfixes

## 4.0.7

  * Added support for Sesame as triplestore synchronization target
  * Ditched Ruby 1.8 API compatibility; iQvoc now requires Ruby 1.9+
  * Improved instant search on front page

## 4.0.6

  * Bugfixes for Triplestore Sync and configuration

## 4.0.5

  * Fixed a bug where triple store sync wouldn't load in engine mode
  * More bugfixes

## 4.0.4

  * Triplestore Sync
  * Bugfixes

## 4.0.3

  * New frontpage with quick search
  * SKOS importer now supports blank nodes
  * Bugfixes

## 4.0.2

  * Support for collections in SKOS importer (@fgimenez)
  * Bugfixes

## 4.0.1 (2012-06-20)

  * Rails application template
  * Bugfixes

## 4.0.0 (2012-05-31)

  * Completely redesigned UI
  * Temporarily removed visualization graph<br>
    Needs to be revisited in the near future
  * Bugfixes

## 3.5.7 (2012-05-24)

  * Rankable (weighted) relations
  * Counting concept members in collection hierarchy view
  * Improved heroku support
  * Bugfixes

Please note that this is the last tiny release before we hit 4.0.0.

## 3.5.6 (2012-03-07)

  * Refactored origin (URI slug) generation<br>
    Now supports custom filters to extend generation logic. See more: https://github.com/innoq/iqvoc/blob/master/lib/iqvoc/origin.rb
  * Bugfixes

## 3.5.4 (2012-02-08)

  * Top concepts<br>
    From now on the hierarchical concept view only lists concepts marked as "top term".
    This also includes a default concept scheme and support for top concepts in RDF views.
  * Configurable navigation<br>
    Use `Iqvoc.navigation_items` to inject additional navigation items.
  * Bugfixes

## 3.5.1 (2012-02-01)

 * Bugfixes

## 3.5.0 (2012-02-01)

 * Instance configuration<br>
   You are now able to provide configuration for certain settings in the browser.

## 3.4.0 (2012-01-27)

 * Rails 3.2
 * Bugfixes

## 3.3.4 (2012-01-16)

 * Import SKOS files via the web frontend
 * Bugfixes

## 3.3.3 (2012-01-13)

 * Several asset pipeline related fixes
 * Largely simplified heroku setup
 * Improvements to engine mode

Detailed commit log: https://github.com/innoq/iqvoc/compare/v3.3.0...v3.3.3

## 3.3.0 (2012-01-10)

 * Rails 3.1
 * Asset pipeline<br>
   [Detailed instructions](https://github.com/innoq/iqvoc/wiki/iQvoc-as-a-Rails-Engine)
   on how to use iQvoc as a Rails Engine (including the asset pipeline).

This is a big update. Detailed commit log: https://github.com/innoq/iqvoc/compare/v3.2.6...v3.3.0

## 3.2.6 (2012-01-10)

 * Small fixes
 * Last tiny version before upgrading iQvoc to from Rails 3.0 to 3.1

## 3.2.5 (2011-12-07)

 * Various bugfixes

## 3.2.4 (2011-11-07)

 * Added search functionality for collections
 * Filter search results for concepts and/or collections
 * IE fixes
 * Various bugfixes
 * Ruby 1.9.3

Detailed commit log: https://github.com/innoq/iqvoc/compare/v3.2.3...v3.2.4

## 3.2.3 (2011-08-22)

 * Minor bugfixes
 * Rails 3.0.10

## 3.2.2 (2011-08-17)

 * Various bugfixes
 * Improved unicode character handling in SKOS importer
 * iQvoc is now built on Travis CI (http://www.travis-ci.org)
 * Rails 3.0.9

## 3.2.1 (2011-07-14)

 * Various bugfixes
 * Improved IE7 compatibility

## 3.2.0 (2011-06-22)

 * Optimized eager loading throughout the system
 * Added dashboard pagination
 * Removed default secret token (see README for details)
 * Improved visualization
 * Replaced will_paginate with kaminari
 * Automatic changeNotes now produce dct:creator statements (instead of umt:editor)
 * Complete review of all controllers, models, helpers, tests and views
 * Extensive refactoring
 * Numerous bugfixes

## 3.1.3 (2011-06-09)

* New feature: now showing a visualization of concept relations on a concept page
* Improved performance of full rdf export
* Bugfixes

For a complete list of changes see https://github.com/innoq/iqvoc/compare/v3.1.2...v3.1.3

## 3.1.2 (2011-05-27)

* Fixed search not respecting a set collection filter
* Added support for a none-language (nil) PrefLabel main language setting
* Replaced existing auto-completion widget with a more sane approach
* Several bugfixes

For a complete list of changes see https://github.com/innoq/iqvoc/compare/v3.1.1...v3.1.2

## 3.1.1 (2011-05-23)

* Fixed regression preventing relations from being saved during concept creation
* Minor UI tweaks (fonts, buttons, semantic markup etc.)
* Various bugfixes and internal refactoring

For a complete list of changes see https://github.com/innoq/iqvoc/compare/v3.1.0...v3.1.1

## 3.1.0 (2011-05-16)

* Extended multilanguage support.
  You can now translate concept PrefLabels by switching the main language in the new control bar.
  It's also possible to translate secondary concept relations by switching the secondary language.
* Several UI tweaks: styleable buttons, 2-column layout for concept templates and more.
* Bugfixes

For a complete list of changes see https://github.com/innoq/iqvoc/compare/v3.0.0...v3.1.0

## 3.0.0 (2011-05-10)

iQvoc has undergone major refactorings and architecture changes. It is now Open Source and publicly available.

## 2.3.0

Features

* iQvoc is now Rails 3 compatible. For a full list of fixes see the according commits
