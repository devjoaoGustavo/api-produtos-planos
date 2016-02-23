# CHECKOUT

## Plans and Products API

The Plans and Products API is a micro service responsible for supplying a CRUD process for a checkout system. It allows the management of products, plans, periodicities and prices.

## PRODUCTS

### Create
Create a new product.
```
POST /products
```

#### Request
```
{
  "name": "Hospedagem",
  "description": "Descrição do produto.",
  "imagem": "www.example.com/images/image.jpg"
}
```

#### Response
```
Status: 201 Created
Location: /products/3

{
  "id": 3,
  "name": "example",
  "description": "teste",
  "image": {
    "url": "/uploads/product/image/3/image.jpg"
  },
  "created_at": "2016-02-23T20:45:17.075Z",
  "updated_at": "2016-02-23T20:45:17.075Z"
}
```

### Index
Get all existing products.
```
GET /products
```

#### Response

```
Status: 200 OK
Location: /products

[ {
    "id":1,
    "name": "Hospedagem",
    "description": "Hospedagem de domínios na Locaweb.",
    "image": {
      "url": "/uploads/product/image/1/image.jpg"
    },
    "created_at": "2016-02-23T20:23:16.855Z",
    "updated_at": "2016-02-23T20:23:16.855Z"
  },
  {
    "id": 2,
    "name": "example",
    "description": "teste",
    "image": {
      "url": "/uploads/product/image/2/image.jpg"
    },
    "created_at": "2016-02-23T20:35:31.714Z",
    "updated_at": "2016-02-23T20:35:31.714Z"
  },
  {
    "id": 3,
    "name": "example",
    "description": "teste",
    "image": {
      "url": "/uploads/product/image/3/image.jpg"
    },
    "created_at": "2016-02-23T20:45:17.075Z",
    "updated_at": "2016-02-23T20:45:17.075Z"
  } ]
```

### Show
Get a existing product.
```
GET /products/3
```

#### Response

```
Status: 200 OK
Location: /products/3

{
  "id": 3,
  "name": "example",
  "description": "teste",
  "image": {
    "url": "/uploads/product/image/3/image.jpg"
  },
  "created_at": "2016-02-23T20:45:17.075Z",
  "updated_at": "2016-02-23T20:45:17.075Z"
}
```
