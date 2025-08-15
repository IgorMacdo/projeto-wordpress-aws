Descrição
-------------------------------------------------------------------------------------------------------------
Com o crescimento contínuo do uso de aplicações web, garantir alta disponibilidade, escalabilidade e resiliência se tornou essencial em qualquer arquitetura moderna. Neste projeto, vamos implantar a plataforma WordPress na nuvem AWS de forma escalável e tolerante a falhas, utilizando os principais serviços gerenciados da AWS para garantir desempenho e disponibilidade.


Arquitetura do Projeto
-------------------------------------------------------------------------------------------------------------

![Diagrama](Imagens/Diagrama.png)

Tecnologias Usadas
-------------------------------------------------------------------------------------------------------------
`☁️AWS` `☁️Amazon EC2` `🗄️RDS MYSQL` `☁️Amazon EFS` `🚦Application Load Balancer` `🐳Docker` `📦Docker Compose` `⚖️Auto Scaling` `WordPress` `Markdown` `💻CMD` `🐚Bash` `YAML` `🐧Amazon Linux 2023` `🐙Github` 

-------------------------------------------------------------------------------------------------------------

### Etapas do Projeto

Aqui estão todas as etapas do projeto, em ordem:

1.  **[Etapa 1 - Criar Arquitetura de rede](Etapa%201%20-%20Criar%20Arquitetura%20de%20rede.md)**
    * **VPC personalizada:**
        * 2 AZs
        * 6 subnets (2 públicas, 4 privadas)
        * IGW para acesso à internet
        * NAT Gateway nas subnets públicas

2.  **[Etapa 2 - Criar Grupos de Segurança](Etapa%202%20-%20Criar%20Grupos%20de%20segurança.md)**
    * **Configuração de Segurança:**
        * Regras para acesso entre os componentes
        * Restrição de acesso a portas específicas (ex: 80, 443, 3306)

3.  **[Etapa 3 - Criar RDS](Etapa%203%20-%20Criar%20o%20RDS.md)**
    * **Detalhes:**
        * Banco de dados MySQL/MariaDB
        * Configurar grupo de segurança para permitir acesso apenas das instâncias EC2

4.  **[Etapa 4 - Criar o EFS](Etapa%204%20-%20Criar%20o%20EFS%20(Elastic%20File%20System).md)**
    * **Detalhes:**
        * Sistema de arquivos NFS montado via EC2
        * Permissões adequadas no SG

5.  **[Etapa 5 - Criar o Launch Template](Etapa%205%20-%20Criar%20Launch%20Template.md)**
    * **Detalhes:**
        * Script user-data instala o WordPress, monta EFS, configura o DB

6.  **[Etapa 6 - Criar Application Load Balancer](Etapa%206%20-%20Load%20Balancer.md)**
    * **Detalhes:**
        * Associado às subnets públicas
        * Encaminha tráfego para o ASG

7.  **[Etapa 7 - Criar Auto Scaling Group](Etapa%207%20-%20Criar%20Auto%20Scaling%20Group.md)**
    * **Detalhes:**
        * Com Launch Template
        * Em subnets privadas
        * Associado ao ALB

8.  **[Etapa 8 - Criar Bastion Host](Etapa%208%20-%20Bastion%20Host.md)**
    * **Detalhes:**
        * Acesso seguro a instâncias privadas via SSH

9.  **[Etapa 9 - Conclusão de Projeto](Etapa%209%20-%20Conclusão.md)**
    * **Detalhes:**
        * Validação final da arquitetura
        
-------------------------------------------------------------------------------------------------------------
### Desenvolvido por
[Igor Macêdo](https://www.linkedin.com/in/macedoigorr/)
(todo e qualquer dado utilizado aqui foi criado e excluido após a finalização do projeto)
