# Azure Kubernetes Infrastructure with Terraform 🚀

A fully modular Terraform project that deploys an Azure Kubernetes Service (AKS) cluster and hosts a Docker container (`surajkk93/year_progress`) using Kubernetes.

> Author: Suraj Kulkarni (@surajkk93)  
> Cloud: Microsoft Azure  
> IaC: Terraform (modular structure)

---

## 📁 Project Structure

```
azure-terraform-infra-modules/
├── main.tf                  # Root configuration
├── variables.tf             # Root input variables
├── terraform.tfvars         # Variable values
├── outputs.tf               # Output values (IP, host, etc.)
├── modules/
│   ├── resource_group/      # Creates Azure Resource Group
│   ├── network/             # Creates VNet & Subnets
│   ├── nsg/                 # Network Security Group rules
│   ├── aks/                 # Azure Kubernetes Service (AKS) cluster
│   └── k8s_deploy/          # Deploys Docker image to AKS
```

---

## 🧱 What It Does

- Creates Azure Resource Group and Network
- Provisions AKS Cluster using `azurerm_kubernetes_cluster`
- Configures Terraform Kubernetes Provider
- Deploys a public Docker image (`surajkk93/year_progress`)
- Exposes it using a LoadBalancer Kubernetes Service
- Fully modular and reusable

---

## 🛠️ How to Use

### 1️⃣ Clone the Repo

```bash
git clone https://github.com/surajkk93/azure-terraform-infra-modules.git
cd azure-terraform-infra-modules
```

### 2️⃣ Set Your Terraform Variables

Update `terraform.tfvars`:

```hcl
location = "East US"
subscription_id = "your-subscription-id"
```

Make sure to export your Azure credentials or be logged in:

```bash
az login
```

### 3️⃣ Initialize Terraform

```bash
terraform init
```

### 4️⃣ Plan & Apply

```bash
terraform plan
terraform apply
```

---

## 🌐 Access Your App

After `terraform apply` finishes, you’ll see an output like:

```
app_loadbalancer_ip = "20.120.xx.xx"
```

Open the app in your browser:

```url
http://20.120.xx.xx
```

🎉 You’ll see the **year progress bar** from Docker image `surajkk93/year_progress`.

---

## 🔐 Sensitive Output Notice

The AKS credentials are output as sensitive and used internally to connect via the Kubernetes provider. No kubeconfig file is required manually.

---

## 📦 Docker Image Used

- **Image:** [`surajkk93/year_progress`](https://hub.docker.com/r/surajkk93/year_progress)
- Public, version `v1`
- Used to demonstrate containerized deployments

---

## 📌 Optional Enhancements

- Add Ingress Controller (Nginx)
- Integrate with Azure Monitor or Prometheus
- Use Terraform Cloud or GitHub Actions
- Add DNS mapping with Azure DNS

---

## 📸 Diagram (Optional)

```
+----------------------------+
|        Azure Cloud         |
|                            |
|  +----------------------+  |
|  |    Resource Group     | |
|  |                      | |
|  |  +----------------+  | |
|  |  |  AKS Cluster    |  | |
|  |  |  (1 node pool)  |  | |
|  |  +--------+-------+  | |
|  |           |          | |
|  |     +-----v------+   | |
|  |     | Deployment |   | |
|  |     | year_progress  | |
|  |     +-----+------+   | |
|  |           |          | |
|  |     +-----v------+   | |
|  |     | LoadBalancer|  | |
|  |     | Public IP   |  | |
|  |     +------------+  | |
|  +----------------------+  |
+----------------------------+
```

---

## 🧠 What You Learned

- Writing modular Terraform code
- Using Azure Resource Manager
- Configuring the Kubernetes provider
- Deploying Docker containers via Terraform to AKS
- Managing state, outputs, and sensitive data

---

## 🧑‍💻 Author

**Suraj Kulkarni**  
[LinkedIn](https://www.linkedin.com/in/surajkulkarni93) • [GitHub](https://github.com/surajkk93)

---

## 📜 License

MIT License. Free to use and adapt for learning and portfolio.