---
title: Events | AmigoBooth API
---

# Events API

* TOC
{:toc}

## List your events

    GET /me/events

### Parameters

sort
: `created`, `updated`, `name`, `date`, default: `date`.

direction
: `asc` or `desc`, default: `desc`

## List user events

    GET /user/:user/events

### Parameters

sort
: `created`, `updated`, `name`, `date`, default: `date`.

direction
: `asc` or `desc`, default: `desc`

### Response

<%= headers 200, :pagination => true %>
<%= json(:event) { |h| [h] } %>

## Get a single event

    GET /users/:user/events/:event_id

### Response

<%= headers 200 %>
<%= json :event_full %>
