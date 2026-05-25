# 🐾 Animal Management App - SAP RAP (ABAP Cloud)

## 📌 Sobre o projeto

Este projeto demonstra a construção de uma aplicação completa utilizando o **RESTful ABAP Programming Model (RAP)** no ambiente **ABAP Cloud (SAP BTP)**.

A aplicação foi desenvolvida com foco em boas práticas de arquitetura, separação de responsabilidades e validação de regras de negócio, utilizando Fiori Elements para geração automática da interface.

---

## ⚙️ Tecnologias e conceitos

- ✅ ABAP Cloud
- ✅ RAP (RESTful ABAP Programming Model)
- ✅ CDS Views (Interface e Projeção)
- ✅ Behavior Definition (Unmanaged)
- ✅ Behavior Implementation (ABAP)
- ✅ OData Service (V2)
- ✅ Fiori Elements (UI automática)
- ✅ Metadata Annotations

---

## 🧠 Arquitetura

A aplicação segue o fluxo padrão do RAP:

Tabela → CDS Interface → CDS Projeção → Behavior → Metadata → Service → Service Binding → Fiori

Cada camada possui responsabilidade bem definida:

- **Tabela:** persistência dos dados  
- **CDS Interface:** modelo de dados  
- **CDS Projeção:** exposição para consumo  
- **Behavior:** regras de negócio  
- **Metadata:** definição da interface  
- **Service:** exposição via OData  

---

## 📦 Funcionalidades

✅ Cadastro de animais  
✅ Exclusão de registros  
✅ Consulta de dados  
✅ Geração automática de ID  
✅ Validação de dados no backend  

---

## 🔒 Regras de negócio

- O campo **Sexo** aceita apenas:
  - `'M'` → Masculino  
  - `'F'` → Feminino  

Caso o valor seja inválido, o sistema:

- bloqueia a criação ❌  
- retorna mensagem de erro ao usuário ✅  

---

## 🎯 Decisões técnicas

- 🔹 ID gerado automaticamente no backend  
- 🔹 Campo ID não editável na UI  
- 🔹 Validação realizada no Behavior Implementation  
- 🔹 Uso de Unmanaged Behavior para controle manual  
- 🔹 Separação clara entre backend e exposição  

---

## 🖥️ Interface (Fiori)

A interface foi gerada automaticamente com **Fiori Elements**, utilizando:

- @UI.lineItem → tabela  
- @UI.identification → tela de detalhe  
- @UI.selectionField → filtros  

---

## 🚀 Melhorias futuras

- 🔄 Implementação de Value Help (dropdown) para campo Sexo  
- 🔄 Uso de UUID para identificação  
- 🔄 Validações adicionais  
- 🔄 Layout otimizado para UX  

---

## 👩‍💻 Autora

Desenvolvido por **Lilian Souza Melo**

---

## 💬 Observação

Este projeto foi desenvolvido com fins de estudo e demonstração do modelo RAP no ABAP Cloud, representando um cenário completo de construção de aplicação SAP moderna.
