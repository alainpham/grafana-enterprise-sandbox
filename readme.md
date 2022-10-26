# Grafana Enterprise Metrics Logs Traces

1. Edit inventory : `inventory/inventory.yml`
2. Place license files into
   - `grafana-enterprise-sandbox-role/templates/ge/config/license/ge.jwt`
   - `grafana-enterprise-sandbox-role/templates/gem/config/license/gem.jwt`
   - `grafana-enterprise-sandbox-role/templates/gel/license/gel.jwt`
   - `grafana-enterprise-sandbox-role/templates/get/license/get.jwt`
3. Review variables files `grafana-enterprise-sandbox-role/defaults/main.yml`
   - `config_folder_root` : where config files will be copied for each component
   - `data_folder_root` : where the data folders will be provisioned for the components to write their data.
4. Run script
   - `ansible-playbook playbooks/run.yml`


WIP : GEL, GET deployment