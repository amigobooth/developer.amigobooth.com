---
title: Events | AmigoBooth API
---

# Events API

* TOC
{:toc}

## List your events

List events owned by the authenticated user.

    GET /me/events

### Parameters

sort
: `created`, `updated`, `name`, `date`, default: `date`.

direction
: `asc` or `desc`, default: `desc`

## List user events

List events owned by the specified user.

    GET /user/:user/events

### Parameters

sort
: `created`, `updated`, `name`, `date`, default: `date`.

direction
: `asc` or `desc`, default: `desc`

## List all events

List all events across all users.

    GET /events

### Parameters

sort
: `created`, `updated`, `name`, `date`, default: `date`.

direction
: `asc` or `desc`, default: `desc`

## List nearby events

    GET /events/:latitude/:longitude

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

## Create an event

Create a new event for the authenticated user.

    POST /me/events

### Input

name
: _Required_ **string**

date
: _Required_ **string**

password
: _Optional_ **string**

coordinates
: _Optional_ **array** - must contain valid latitude and longitude as floats

editing_preset
: _Optional_ **string** - permitted values are `none`, `film`, or `film_bw`. Default is `none`.

<%= json \
    :name     => "Office Party",
    :date     => "2012-12-09",
    :password => "dundermiflin",
    :coordinates => [32.7993,-117.16]
%>

### Response

<%= headers 201, :Location => "https://amigobooth.com/api/v1/users/dwight/events/1" %>
<%= json :event_authenticated %>

## Update an event

Update the provided event.

    PATCH /me/events/:event_id

### Input

name
: _Required_ **string**

date
: _Required_ **string**

password
: _Optional_ **string**

coordinates
: _Optional_ **array** - must contain valid latitude and longitude as floats

editing_preset
: _Optional_ **string** - permitted values are `none`, `film`, or `film_bw`. Default is `none`.

<%= json \
    :name     => "Office Party",
    :date     => "2012-12-09",
    :password => "dundermiflin",
    :coordinates => [32.7993,-117.16]
%>

### Response

<%= headers 200 %>
<%= json :event_authenticated %>

## Delete an event

Delete the provided event. This permanently deletes this event along with all
associated shots.

    DELETE /me/events/:event_id

### Response

<%= headers 204 %>
