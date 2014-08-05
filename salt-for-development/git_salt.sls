include:
  - salt-for-development

rallytime_salt:
  git.latest:
    - name: https://github.com/rallytime/salt.git
    - target: /home/dev-user/SaltStack/salt
    - remote_name: rallytime
  cmd.run:
    - name: git remote add upstream https://github.com/saltstack/salt
    - cwd: /home/dev-user/SaltStack/salt
    - require:
      - git: rallytime_salt
    - require_in:
      - cmd: fetch_upstream_salt
      - cmd: pull_salt_develop

fetch_upstream_salt:
  cmd.run:
    - name: git fetch upstream
    - cwd: /home/dev-user/SaltStack/salt
    - require_in:
      - cmd: pull_salt_develop
      - cmd: branch_salt_2014.1
      - cmd: branch_salt_2014.7

pull_salt_develop:
  cmd.run:
    - name: git pull upstream develop
    - cwd: /home/dev-user/SaltStack/salt

branch_salt_2014.1:
  cmd.run:
    - name: git branch 2014.1 upstream/2014.1
    - cwd: /home/dev-user/SaltStack/salt

branch_salt_2014.7:
  cmd.run:
    - name: git branch 2014.7 upstream/2014.7
    - cwd: /home/dev-user/SaltStack/salt
