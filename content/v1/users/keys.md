---
title: User Authentication Keys | GitHub API
---

# User Authentication Keys API

* TOC
{:toc}

Management of public keys via the API requires that you are
authenticated.

## Create a new key

    POST /me/keys

### Response

<%= headers 200 %>
<%= json(:key) { |h| [h] } %>

## Delete a public key

    DELETE /me/keys/:token

### Response

<%= headers 204 %>
