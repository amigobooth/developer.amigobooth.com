---
title: User Authentication Keys | AmigoBooth API
---

# User Authentication Keys API

* TOC
{:toc}

Management of authentication keys via the API requires that you are
authenticated.

## Create a new key

To create a new key, you must authenticate with HTTP Basic Authentication
using your account email address and password.

    POST /me/keys

### Input

description
: _Optional_ **string**

<%= json \
    :description => "Dwight's iPhone 5"
%>

### Response

<%= headers 200 %>
<%= json(:key) %>

## Revoke a key's access

    DELETE /me/keys/:token

### Response

<%= headers 204 %>
