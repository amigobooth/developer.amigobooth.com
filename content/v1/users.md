---
title: Users | AmigoBooth API
---

# Users API

* TOC
{:toc}

Many of the resources on the users API provide a shortcut for getting
information about the currently authenticated user. If a request URL
does not include a `:user` parameter then the response will be for the
logged in user (and you must pass [authentication
information](/v3/#authentication) with your request).

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
