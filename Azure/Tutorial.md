### Begin the Azure journey

#### Notes for myself

Udemy:
microsoft-azure-from-zero-to-hero-the-complete-guide

Link:
<https://portal.azure.com>

1. Subscription Free Trail/Microsoft/Pay as you go

`az login`
`az account list`
`az group list`

Mgmt Groups -> Subscriptions -> RG -> Resources

SLA calculate:
<https://uptime.is/>

### Virtual Machines

1. Defualt VM with new RG and available subscriptions.

2. Optimised VM with Availability set/Availabity Zone

    - Fault domain/Update domain (2/3)
    - Availablity Zone (Different DS)
    - HDD to SSD (Hight throughput)

3. ARM template (Download or upload and deploy)

4. Delete VM and assosiated resource, last RG

5. Scale Set

    - `az provider show --namespace microsoft.insights -o table`

6. Metadata service

    - Provide event details if VM get deleted or shutdown by Azure service

7. App service (Build and deploy code to the App service)

    - Use the Build service to build the code and deploy in app service.
    - NSG (All inbound ports are allowed)
    - Access restrictions (not in free Tier) restrict only IP for APP service

8. AKS

    - Kube service
    - Add nodes and Deploy a sample application via Container registry.
    - Minimal cluster, dev/test
    - Quota for VM in the region
    - `az provider show --namespace Microsoft.ContainerRegistry -o table`

9. Azure Functions

    - Trigger and Binding (Timer and Event)
    - Cold start (Specical allocation and run the functions)
    - Hosting plans
        - Consumption plan ( <= 1.5G RAM, Cold start)
        - Premium plan (1 pre warmed(2vcpus, 7GB))
        - Dedicated plan (no auto scale)
    - Durable Functions

    - Example:
        - `brew tap azure/functions && brew install azure-functions-core-tools@4`

10. Choose right compute type.
    - Function vs AKS vs App service vs VM's
    - Logic Apps, ACI , App service Container

### Networking

1. Vnets (same like VPC in AWS)

    - CIDR (classless inter domain routing )

    ```bash
    10.120.244.120/32 - Per IP (8bits.8bits.8bits.8bits)

    109.186.149.240/24 ---> Size = 2^(32-24) = 2^8 = 256
    ```

    - Subnets (Fontend/Backend)

    - NSG(mini firewall)

        - Add a service Tag as best practise

    - Network Peering (Vnet <-> Vnet2)

    - Network watcher

    - Secured Access (JIT, VPN, JumpBox, Bastion - Require portal access)

    - Service Endpoints (Route -> managed service) ( subnet is the source of traffic) - leagcy

    - Private Link (not free & On perm supported)

2. LoadBalancer

    - Standard vs Basic
    - Rules:

        - Frontend IP config
        - Backend Pools
        - Health Probes
        - Load Balancing Rules

    - Application GW (similar to LB)
        - Route based routing
        - WAF (firwall on request)
        - App service behind the Application GW
