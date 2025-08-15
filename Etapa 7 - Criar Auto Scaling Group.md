Nessa etapa será criado o auto scaling group, que tem a finalidade de garantir escalabilidade e disponibilidade do WordPress, criando, removendo e balanceando instâncias, usufruindo do Launch Template

Acesse a **AWS > EC2 > Auto Scaling Groups**
- Nome: asg-wordpress
- Modelo de execução: template-wordpress ✅(modelo de execução criado)

![ASG](Imagens/7_ASG.png)

Clique em Próximo

Rede
- VPC: wordpress-pvc
- Zonas de disponibilidade e sub-redes:
    us-east-2a ✅

    sub-rede: `WordPress-Private-1`
  
    us-east-2b ✅

    sub-rede: `WordPress-Private-2` `WordPress-Private-3` `WordPress-Private-4` 

- Distribuição da zona de disponibilidade: Melhor esforço equilibrado ✅

![ASG_REEDE](Imagens/7_ASG_Rede.png)

Clique em Próximo
Balanceamento de carga
Selecione: **Anexar a um balanceador de carga existente**

Anexar a um balanceador de carga existente
**Escolha entre seus grupos de destino de balanceador de carga** ✅
Grupos de destino de balanceador de cargas existentes
**HTTP-WordPress** ✅

Deslize até chegar em Verificações de integridade
Marque a caixa: **Ative as verificações de integridade do Elastic Load Balancing** ✅
**Período de tolerância da verificação de integridade**: 300 segundos ✅

![ASGVerify](Imagens/7_asgverify.png)

Clique em Próximo

Tamanho do grupo
- Capacidade desejada: 2
Escalabilidade
- Capacidade mínima desejada: 2
- Capacidade máxima desejada: 4

![ASGTamanho](Imagens/7_asg_tamanho.png)

Deslize até Configurações adicionais
- Monitoramento: Habilite a coleta de métricas de grupo no CloudWatch ✅

![ASGCloudWatch](Imagens/7_ASG_CloudWatch.png)

Clique em Próximo até Criar grupo do Auto Scaling
