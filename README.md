# 📜 Relatório

**Nome do Estagiário: Luis Henrique Sampaio**  
**Data: 30/08/2024**


## 📚 Resumo da Tarefa
### 📊 Relatório de Consolidação de Dados com Hive SQL

Este relatório descreve o processo de criação e manipulação de duas tabelas, `campanhas` e `purchases`, usando Hive SQL, para consolidar dados sobre clientes, campanhas e compras. O objetivo é obter uma visão abrangente do comportamento dos clientes e da eficácia das campanhas de marketing. 

### 🛠️ Estrutura das Tabelas e Carregamento de Dados

Inicialmente, definimos a estrutura das tabelas `campanhas` e `purchases`, e em seguida, carregamos os dados de arquivos CSV armazenados no Amazon S3. Este processo nos permite consolidar as informações essenciais para a análise.

### 🔎 Criação da Visão Consolidada

Após a estruturação das tabelas, criamos uma visão chamada `consolidated_data`. Esta visão agrega informações cruciais para cada cliente, incluindo:

- **Total Gasto**: Soma dos valores das compras.
- **Local de Compra Mais Frequente**: Identificação do local onde o cliente mais realizou compras.
- **Data da Primeira e Última Compra**: Registros da primeira e última transações do cliente.
- **Campanha Mais Recebida**: Campanha de marketing que o cliente mais recebeu.
- **Quantidade de Campanhas com Status "Error"**: Contagem das campanhas que não foram entregues corretamente.

### 📅 Inclusão de Data e Formatação de Ano/Mês

A visão também incorpora a data atual e adiciona uma formatação específica para o ano e mês, facilitando a análise temporal.

### 🧠 Uso de Subconsultas para Análises Detalhadas

Subconsultas são utilizadas para identificar os locais de compra e campanhas mais frequentes. O resultado final é exibido através de um **SELECT** simples, garantindo uma visão consolidada e útil para análise do comportamento dos clientes e da eficácia das campanhas.

### 💡 Conclusão

Este processo garante que a visão consolidada forneça insights valiosos para decisões estratégicas de marketing, ajudando a entender melhor o comportamento dos clientes e a otimizar as campanhas futuras.

***

### 💫 Passo a Passo


- **Gerar tabelas** 

~~~
%hive

-- Criando Tabela
CREATE TABLE purchases (
    purchase_id STRING,
    product_name STRING,
    product_id STRING,
    amount INT,
    price DECIMAL(10, 2),
    discount_applied DOUBLE,
    payment_method STRING,
    purchase_datetime TIMESTAMP,
    purchase_location STRING,
    client_id STRING
) ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3a://datasets/purcashe_data/'
~~~

~~~
%hive

-- Criando Tabela
CREATE TABLE campaigns (
    lines BIGINT,
    id_campaign STRING,
    type_campaign STRING,
    days_valid STRING,
    data_campaign STRING,
    channel STRING,
    return_status STRING,
    return_date STRING,
    client_id STRING
) ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3a://datasets/campaign_data/'
TBLPROPERTIES ("skip.header.line.count"="1")
~~~

- **Carregando Datasets**
~~~
  %hive

LOAD DATA INPATH 's3a://datasets/campaigns_2023_hist.csv' INTO TABLE campaigns 

LOAD DATA INPATH 's3a://datasets/purchases_2023.csv' INTO TABLE purchases
~~~

- **Normalização**

~~~
  %hive

SELECT
    client_id,
    ROUND(SUM(price * amount * discount_applied), 2) AS total_price,
    MAX(purchase_location) AS most_purchase_location,
    DATE_FORMAT(MIN(purchase_datetime), 'yyyy-MM-dd HH:mm') AS first_purchase,
    DATE_FORMAT(MAX(purchase_datetime), 'yyyy-MM-dd HH:mm') AS last_purchase
FROM purchases
GROUP BY client_id
~~~

- **Campanha mais recebida**

~~~
  %hive

-- Query para most_campaign (Campanha mais recebida pelo cliente)
SELECT 
    client_id, 
    SUM(CASE WHEN return_status != 'error' THEN 1 ELSE 0 END) AS most_campaign,
        SUM(CASE WHEN return_status = 'error' THEN 1 ELSE 0 END) AS quantity_error
FROM 
    campaigns
GROUP BY 
    client_id
~~~

  - **Retornaram status "error"**

  ~~~
  %hive

    SELECT
    id_campaign,
    COUNT(*) AS quantity_error
    FROM
    campaigns
    WHERE
    return_status = 'sms'
    GROUP BY
    id_campaign
~~~
***





