TA Redmine Macros
=================

Installation
------------

Put this repo in `REDMINE_ROOT/vendor/plugins`

Usage
-----

    {{issue_status(123)}}
    => "Open" (with a link on issue 123)

    {{issue_progress(123)}}
    => "[=====  ] 70%"
