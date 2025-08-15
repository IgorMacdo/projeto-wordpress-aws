Nessa etapa, será criado o banco de dados
Acesse a AWS, busque na barra de pesquisa por **Aurora and RDS**
Antes de criar um banco de dados, busque no painel a esquerda **Grupo de sub-redes**

![PrivateGroup](Imagens/3_0_GrupoPrivado.png)

**Crie um grupo contendo todas as sub-redes privadas**
- Nome: RDS-GrupoPrivado
- Descrição: Grupo privado
- VPC: wordpress-vpc
- Zonas de disponibilidade: us-east-2a✅ us-east-2b✅
- Sub-redes: Selecione todas as Privadas ✅

![GrupoPrivado](Imagens/3_0_1GrupoPrivado.png)


A esquerda do painel, clique em banco de dados, após isso, cliquem em Criar um banco de dados

**Configurações do Banco de Dados**
- Opções de mecanismo: MySQL ✅
- Modelo: Nível gratuito ✅
- Disponibilidade e durabilidade: Single AZ1 ✅

![TIPO_RDS](Imagens/3_RDS_TIPO.png)

![TipoEModeloRDS](Imagens/3_1_RDS_TIPO_MODELO.png)

**Configurações de Credenciais e instância**
- Identificador do cluster de banco de dados: RDS-Wordpress
- Nome do usuário principal: admin
- Senha principal: `<sua senha>` 
- Confirmar senha
- Configuração de instância: db.t3.micro ✅

![ConfigRDS](Imagens/3_2ConfigsRDS.png)

![ConfigInstancia](Imagens/3_3_Config_Instancia.png)

**Conectividade**
- Nuvem privada virtual(VPC): wordpress-vpc ✅
- Grupo de sub-redes de banco de dados: rds-grupoprivado ✅
- Grupo de segurança da VPC existentes: WordPress-RDS-SG ✅ (exclua o default)
- Zona de disponibilidade: us-east-2b ✅

![ConectividadeRDS](Imagens/3_4Conectividade.png)

![RDSConectividade](Imagens/3_4_1Conectividade.png)

⚠ **IMPORTANTE** ⚠
Configuração adicional
Opções de banco de dados > Nome do banco de dados inicial: databasewordpress ✅

![ConfigImportante](Imagens/3_5IMPORTANTECONFIGADD.png)

Após finalizar essas configurações, clique em criar banco de dados e aguarde finalizar pois demora.