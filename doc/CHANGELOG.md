# Netgen Admin UI Bundle changelog

## 2.3.1 (10.07.2018)

* Load list of applied and related layouts via AJAX, to fix issues with view cache

## 2.3.0 (29.06.2018)

* Redesigned "Manage layouts" button. Instead of the popup, mapped layouts are now in a tab on node view page
* Added possibility to clear the caches for mapped layouts directly on node view page
* Added list of related layouts (layouts where current node or object are added as a manual item in a block)
* Added support for new Netgen Information Collection admin interface

## 2.2.0 (23.02.2018)

* New bundle structure, now using PSR-4
* Override object state eZ Platform Admin UI routes conflicting with eZ Publish Legacy

## 2.1.4 (15.01.2018)

* Fix exception when using preview with activated legacy `ezformtoken` extension

## 2.1.3 (08.01.2018)

* Add option to installer to ask for siteaccess group to base the config on

## 2.1.2 (22.12.2017)

* Override eZ Platform Admin UI routes conflicting with eZ Publish Legacy

## 2.1.1 (21.12.2017)

* Fix a crash when Netgen Tags Bundle is installed but not activated

## 2.1.0 (14.12.2017)

* Mark all services as private/public for compatibility with Symfony 3.4
* Test on eZ kernel 6 and PHP 7.2

## 2.0.4 (21.11.2017)

* Allow installing eZ kernel 7.0
* Add some tests (thanks @RandyCupic)
* Styling unstyled pages
* Various fixes to design

## 2.0.3 (25.09.2017)

* Use setter injection for an event listener to fix deprecation notice
* Added French translations (thanks @sdaoudi)
* Fix install docs (thanks @sdaoudi)

## 2.0.2 (05.07.2017)

* Fixed showing Netgen Layouts location mappings on eZ Publish 5

## 2.0.1 (19.06.2017)

* Allow installation of version 2.x of `lolautruche/ez-core-extra-bundle`
* Added German translations (thanks @dfritschy)
* Added basic PHPUnit tests (thanks @MarioBlazek)

## 2.0.0 (05.06.2017)

* Initial open source release
