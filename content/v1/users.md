---
title: Users | AmigoBooth API
---

# Users API

* TOC
{:toc}

## Get a single user

    GET /users/:user

### Response

<%= headers 200 %>
<%= json :user_full %>

## Get the authenticated user

    GET /me

### Response

<%= headers 200 %>
<%= json :user_authenticated %>

## Update the authenticated user

    PATCH /me

### Input

name
: _Optional_ **string**

email
: _Optional_ **string** - Publicly visible email address.

<%= json \
    :name     => "Dwight Schrute"
%>

### Response

<%= headers 200 %>
<%= json :user_authenticated %>
