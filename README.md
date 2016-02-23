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
## PLANS

### Create
Create a new plans
```
POST /plans
```
#### Request
```
{
  "name": "Plus",
  "description": "Hospedagem plus. Aquela que você sempre sonhou.",
  "details": "['50 kb de armazenamento', '2 contas de email']",
  "product_id": 1
}
```
#### Response
```
Status 201 Created
Location: /plans/3

{
  "id": 3,
  "name": "Plus",
  "description": "Hospedagem plus da Locaweb. Compre já",
  "details": ["5gb de armazenamento","2 contas de emails"],
  "created_at": "2016-02-23T23:07:46.008Z",
  "updated_at": "2016-02-23T23:07:46.008Z",
  "product_id": 1
}
```
### Index
Get all registered plans
```
GET /plans
```
#### Response
```
Status 200 OK
Location: /plans

[ {
    "id": 1,
    "name": "Profissional",
    "description": "Plano profissional com todos os opcionais.",
    "details": "Detalhes do plano.",
    "created_at": "2016-02-23T22:34:49.288Z",
    "updated_at": "2016-02-23T22:34:49.288Z",
    "product_id": 1
  },
  {
    "id": 3,
    "name": "Plus",
    "description": "Hospedagem plus da Locaweb. Compre já",
    "details": "5gb de armazenamento,2 contas de emails",
    "created_at": "2016-02-23T23:07:46.008Z",
    "updated_at": "2016-02-23T23:07:46.008Z",
    "product_id": 1
} ]
```
### Show
Get a registered plan
```
GET /plans/3
```
#### Response
```
Status 200
Location /plans/3

{
  "id": 3,
  "name": "Plus",
  "description": "Hospedagem plus da Locaweb. Compre já",
  "details": "5gb de armazenamento,2 contas de emails",
  "created_at": "2016-02-23T23:07:46.008Z",
  "updated_at": "2016-02-23T23:07:46.008Z",
  "product_id": 1,
  "product_path": "/products/1"
}
```
