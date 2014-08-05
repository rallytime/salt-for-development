include:
  - salt-for-development

rallytime_salt_testing:
  git.latest:
    - name: https://github.com/rallytime/salt-testing.git
    - target: /home/dev-user/SaltStack/salt-testing
    - remote_name: rallytime
  cmd.run:
    - name: git remote add upstream https://github.com/saltstack/salt-testing
    - cwd: /home/dev-user/SaltStack/salt-testing
    - require:
      - git: rallytime_salt_testing
    - require_in:
      - cmd: fetch_upstream_salt_testing

fetch_upstream_salt_testing:
  cmd.run:
    - name: git fetch upstream
    - cwd: /home/dev-user/SaltStack/salt-testing
