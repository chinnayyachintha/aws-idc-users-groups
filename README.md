
# terraform-aws-identity-center-users-and-groups

Create and manage AWS IAM Identity Center (formerly AWS SSO) **users**, **groups**, and **group memberships** using Terraform.

This module works alongside [`terraform-aws-identity-center`](https://github.com/aws-samples/terraform-aws-identity-center) and is deliberately decoupled to give you flexibility in managing identities independently from permission sets and account assignments.

---

## 📦 Module Usage

```hcl
module "idc_users_and_groups" {
  source  = "aws-samples/identity-center-users-and-groups/aws"
  version = "1.0.0"

  groups = "./groups.yml"
  users  = "./users.yml"
}
```

- `groups.yml` and `users.yml` define your **IAM Identity Center groups**, **users**, and **memberships**.
- This module then handles the creation using `aws_identitystore_user`, `aws_identitystore_group`, and `aws_identitystore_group_membership`.

---

## 🧾 YAML Templates

### ✅ Example `groups.yml`

```yaml
groups:
  - display_name: "Admins"
    description: "Administrator group"
  - display_name: "Developers"
    description: "Development team group"
```

---

### ✅ Example `users.yml`

```yaml
users:
  - user_name: "jane.doe"
    display_name: "Jane Doe"
    emails:
      - value: "jane.doe@example.com"
        primary: true
    groups:
      - "Admins"

  - user_name: "john.dev"
    display_name: "John Dev"
    emails:
      - value: "john.dev@example.com"
        primary: true
    groups:
      - "Developers"
```

---

## 🚫 What This Module Does **Not** Do

This module **does not create permission sets or account assignments**.  
To manage those, use: [terraform-aws-identity-center](https://github.com/aws-samples/terraform-aws-identity-center)

This separation:
- Helps avoid unintended `depends_on` behavior in large orgs.
- Makes the module easier to use with **external IdPs** (like Okta or Azure AD).
- Encourages **decoupling** for better scale and stability.

---

## 📚 Related Resources

- [AWS IAM Identity Center User Guide](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html)
- [Terraform Registry - Module](https://registry.terraform.io/modules/aws-samples/identity-center-users-and-groups/aws/latest)
- [terraform-aws-identity-center (Permission Sets & Assignments)](https://github.com/aws-samples/terraform-aws-identity-center)

