# eyplib

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What eyplib affects](#what-eyplib-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage](#usage)
5. [Reference](#reference)
    * [facts](#facts)
6. [Development](#development)
    * [Contributing](#contributing)

## Overview

Standard library of resources for Puppet modules.

## Module Description

Contains common functions for eyp modules and node classification facts

## Setup

Installing the eyplib module adds the functions, facts, and resources of this standard library to Puppet.

### What eyplib affects

After you've installed eyplib, all of its functions, facts, and resources are already available.

### Setup Requirements

Requires pluginsync enabled

## Usage

Just add a dependency on your **metadata.json** file, for example:

```json
"dependencies": [
  {"name":"puppetlabs/stdlib","version_requirement":">= 4.6.0"},
  {"name":"puppetlabs/concat","version_requirement":">= 1.2.3"},
  {"name":"eyp/eyplib","version_requirement":">= 0.1.0 < 0.2.0"}
],
```

in ERB files you can call this module's functions using:

```erb
<%= scope.function_bool2onoff([@trace]) %>
```

to download a file you can use the download type:

```
download { 'salt':
  url => 'https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm',
  creates => '/tmp/test_repo_salt',
}
```

## Reference

### facts

#### eypconf_platformid

/opt/eypconf/id/platformid.sh /opt/eypconf/id/platformid

**eypconf_platformid_uppercase** and **eypconf_platformid_lowercase**

#### eypconf_magic_hash

/opt/eypconf/id/magic.sh /opt/eypconf/id/.magic

#### eypconf_env

/opt/eypconf/id/env.sh /opt/eypconf/id/env

**eypconf_env_uppercase** and **eypconf_env_lowercase**

#### eypconf_type

/opt/eypconf/id/type.sh /opt/eypconf/id/type

**eypconf_type_uppercase** and **eypconf_type_lowercase**

#### eypconf_servergroup

/opt/eypconf/id/servergroup.sh /opt/eypconf/id/servergroup

**eypconf_servergroup_uppercase** and **eypconf_servergroup_lowercase**

#### eypconf_userid

/opt/eypconf/id/userid.sh /opt/eypconf/id/userid

**eypconf_userid_uppercase** and **eypconf_userid_lowercase**

#### eypconf_customer

/opt/eypconf/id/customer.sh /opt/eypconf/id/customer

**eypconf_customer_uppercase** and **eypconf_customer_lowercase**

### types

#### download

download a file using wget checking that the resulting file is not empty

### functions

#### bool2boolstr

Transform a boolean to a string (**true** or **false**). Other values through.

#### bool2number

Transform a boolean (it can also be a string) to **0** or **1**. Other values through.

#### bool2onoff

Transform a boolean (it can also be a string) to **On** or **Off**. Other values through.

#### bool2yesno

Transform a boolean (it can also be a string) to **yes** or **no**. Other values through.

#### bool2yn

Transform a boolean (it can also be a string) to **y** or **n**. Other values through.

#### retcode2bool

Transform a return code to a bool (0: true, other values: false)


## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
