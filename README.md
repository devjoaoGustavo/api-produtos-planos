# CHECKOUT

## Plans and Products API

The Plans and Products API is a micro service responsible for supplying a CRUD process for a checkout system. It allows the management of products, plans, periodicities and prices.

## PRODUCTS

### Create
Create a new product.
```
POST /api/products
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
Location: /api/products/3

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
GET /api/products
```

#### Response

```
Status: HTTP/1.1 200 OK
Location: /api/products

[
  {
    "id": 1,
    "name": "Hospedagem",
    "description": "Hospedagem de domínios na Locaweb.",
    "image": {
      "url": "/uploads/product/image/1/image.jpg"
    },
    "created_at": "2016-02-24T22:23:52.846Z",
    "updated_at": "2016-02-24T22:23:52.846Z"
  },
  {
    "id": 2,
    "name": "Email",
    "description": "Email na Locaweb.",
    "image": {
      "url": "/uploads/product/image/2/image.jpg"
    },
    "created_at": "2016-02-24T22:23:52.996Z",
    "updated_at": "2016-02-24T22:23:52.996Z"
  }
]
```

### Show
Get a existing product.
```
GET /api/products/1
```

#### Response

```
Status: HTTP/1.1 200 OK
Location: /api/products/1

{
  "product": {
    "id": 1,
    "name": "Hospedagem",
    "description": "Hospedagem de domínios na Locaweb.",
    "image": {
      "url": "/uploads/product/image/1/image.jpg"
    },
    "created_at": "2016-02-24T22:23:52.846Z",
    "updated_at": "2016-02-24T22:23:52.846Z",
    "plans_path": "/api/products/1/plans"
  },
  "plans": [
    {
      "id": 1,
      "name": "Profissional",
      "description": "Plano profissional com todos os opcionais.",
      "details": "Detalhes do plano.",
      "created_at": "2016-02-24T22:23:53.136Z",
      "updated_at": "2016-02-24T22:23:53.136Z",
      "product_id": 1,
      "plan_path": "/api/plans/1",
      "prices_path": "/api/plans/1/prices"
    },
    {
      "id": 2,
      "name": "Básico",
      "description": "Plano básico com todos os opcionais.",
      "details": "Detalhes do plano.",
      "created_at": "2016-02-24T22:23:53.261Z",
      "updated_at": "2016-02-24T22:23:53.261Z",
      "product_id": 1,
      "plan_path": "/api/plans/2",
      "prices_path": "/api/plans/2/prices"
    }
  ]
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
GET /api/plans?product_id=1
GET /api/products/1/plans
```

#### Response
```
HTTP/1.1 200 OK
Location: /api/plans
Location: /api/products/1/plans

[
  {
    "id": 1,
    "name": "Profissional",
    "description": "Plano profissional com todos os opcionais.",
    "details": "Detalhes do plano.",
    "created_at": "2016-02-24T22:23:53.136Z",
    "updated_at": "2016-02-24T22:23:53.136Z",
    "product_id": 1,
    "plan_path": "/api/plans/1",
    "prices_path": "/api/plans/1/prices"
  },
  {
    "id": 2,
    "name": "Básico",
    "description": "Plano básico com todos os opcionais.",
    "details": "Detalhes do plano.",
    "created_at": "2016-02-24T22:23:53.261Z",
    "updated_at": "2016-02-24T22:23:53.261Z",
    "product_id": 1,
    "plan_path": "/api/plans/2",
    "prices_path": "/api/plans/2/prices"
  }
]
```

### Show
Get a registered plan
```
GET /plans/3
```
#### Response
```
Status: HTTP/1.1 200 OK
Location: /plans/1

{
  "plan": {
    "id": 1,
    "name": "Profissional",
    "description": "Plano profissional com todos os opcionais.",
    "details": "Detalhes do plano.",
    "created_at": "2016-02-24T22:23:53.136Z",
    "updated_at": "2016-02-24T22:23:53.136Z",
    "product_id": 1,
    "product_path": "/api/products/1",
    "prices_path": "/api/plans/1/prices"
  },
  "periodicities": [
    {
      "id": 1,
      "name": "Semestral",
      "deadline": 6,
      "created_at": "2016-02-24T22:23:53.527Z",
      "updated_at": "2016-02-24T22:23:53.527Z",
      "value": "3.99"
    },
    {
      "id": 2,
      "name": "Mensal",
      "deadline": 1,
      "created_at": "2016-02-24T22:23:53.652Z",
      "updated_at": "2016-02-24T22:23:53.652Z",
      "value": "5.99"
    },
    {
      "id": 3,
      "name": "Anual",
      "deadline": 12,
      "created_at": "2016-02-24T22:23:53.777Z",
      "updated_at": "2016-02-24T22:23:53.777Z",
      "value": "7.99"
    }
  ]
}
```

## PERIODICITIES

### Index
Show all available periodicities
```
GET /api/periodicities
```

#### Response
```
Status: HTTP/1.1 200 OK
Location: /api/periodicities

[
  {
    "id": 1,
    "name": "Semestral",
    "deadline": 6,
    "created_at": "2016-02-24T22:23:53.527Z",
    "updated_at": "2016-02-24T22:23:53.527Z"
  },
  {
    "id": 2,
    "name": "Mensal",
    "deadline": 1,
    "created_at": "2016-02-24T22:23:53.652Z",
    "updated_at": "2016-02-24T22:23:53.652Z"
  },
  {
    "id": 3,
    "name": "Anual",
    "deadline": 12,
    "created_at": "2016-02-24T22:23:53.777Z",
    "updated_at": "2016-02-24T22:23:53.777Z"
  }
]
```

### Show
Show a specific periodicity's info
```
GET /api/periodicities/1
```

#### Response
```
Status: HTTP/1.1 200 OK
Location: /api/periodicities/1

{
  "id": 1,
  "name": "Semestral",
  "deadline": 6,
  "created_at": "2016-02-24T22:23:53.527Z",
  "updated_at": "2016-02-24T22:23:53.527Z"
}
```

## PRICES

### Index
Show all prices in each periodicity for a plan
```
GET /api/plans/1/prices
```

#### Response
```
Status: HTTP/1.1 200 OK
Location: /api/plans/1/prices

[
  {
    "id": 1,
    "name": "Semestral",
    "deadline": 6,
    "created_at": "2016-02-24T22:23:53.527Z",
    "updated_at": "2016-02-24T22:23:53.527Z",
    "value": "3.99"
  },
  {
    "id": 2,
    "name": "Mensal",
    "deadline": 1,
    "created_at": "2016-02-24T22:23:53.652Z",
    "updated_at": "2016-02-24T22:23:53.652Z",
    "value": "5.99"
  },
  {
    "id": 3,
    "name": "Anual",
    "deadline": 12,
    "created_at": "2016-02-24T22:23:53.777Z",
    "updated_at": "2016-02-24T22:23:53.777Z",
    "value": "7.99"
  }
]
```

### Show
Show a specific price's info using its ID
```
GET /api/prices/1
```

#### Response
```
Status: HTTP/1.1 200 OK
Location: /api/prices/1

{
  "id": 1,
  "periodicity_id": 1,
  "plan_id": 1,
  "value": "1.99",
  "plan_path": "/api/plans/1",
  "periodicity_path": "/api/periodicities/1"
}
```
