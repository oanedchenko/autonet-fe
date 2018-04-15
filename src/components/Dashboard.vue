<template>
  <div>
    <md-toolbar>
      <h3>Department:</h3>
      <md-menu md-close-on-select>
        <md-button md-menu-trigger>{{selectedDepartment.name}}</md-button>
        <md-menu-content>
          <md-menu-item v-for="department in departments" @click="selectDepartment(department)">{{department.name}}
          </md-menu-item>
        </md-menu-content>
      </md-menu>
      <h3>Team:</h3>
      <md-menu md-close-on-select>
        <md-button md-menu-trigger>{{selectedTeam.name}}</md-button>
        <md-menu-content>
          <md-menu-item v-for="team in teams" @click="selectTeam(team)">{{team.name}}</md-menu-item>
        </md-menu-content>
      </md-menu>
    </md-toolbar>
    <div class="users-cards">
      <div v-for="user in users" class="card-expansion">
        <md-card>
          <md-card-media>
            <img src="../assets/gopher_256x256.png" style="width: 200px;" alt="People">
          </md-card-media>

          <md-card-header>
            <div class="md-title">{{user.firstName}} {{user.lastName}}</div>
            <div class="md-subhead">{{user.jobTitle}}</div>
          </md-card-header>

          <md-card-content>
            <hr/>
            <div class="context-box">
              <div v-for="contact in user.contacts">
                <md-icon class="md-size-x">{{contact.type}}</md-icon>
                {{contact.value}}
              </div>
            </div>
          </md-card-content>

          <md-card-expand>
            <md-card-actions md-alignment="space-between">
              <div>
              </div>

              <md-card-expand-trigger>
                <md-button class="md-icon-button">
                  <md-icon>keyboard_arrow_down</md-icon>
                </md-button>
              </md-card-expand-trigger>
            </md-card-actions>

            <md-card-expand-content>
              <md-card-content>
                <!--todo: we do not have such field yet :)-->
                {{user.details}}
              </md-card-content>
            </md-card-expand-content>
          </md-card-expand>
        </md-card>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';

  const api = axios.create({
    baseURL: process.env.API_BASE_URL,
  });

  const e = {name: " - ALL - "};

  export default {
    name: 'Dashboard',
    data() {
      return {
        departments: [],
        selectedDepartment: e,
        teams: [],
        selectedTeam: e,
        users: []
      }
    },
    created: function () {
      api.get('/department')
        .then(resp => {
          this.departments = [e];
          this.departments = this.departments.concat(resp.data.items);
        })
        .catch(e => {
          console.log(e);
        });

      this.loadTeams();
      this.loadUsers();
    },
    methods: {
      selectDepartment: function (department) {
        this.selectedDepartment = department || e;
        console.log("Selected department: " + JSON.stringify(department));
        this.loadTeams();
        this.loadUsers();
      },
      selectTeam: function (team) {
        this.selectedTeam = team || e;
        console.log("Selected team: " + JSON.stringify(team));
        this.loadUsers();
      },
      loadTeams: function() {
        var params = {};
        if (this.selectedDepartment && this.selectedDepartment.id) {
          params.departmentId = this.selectedDepartment.id;
        }

        console.log("Team request params: " + JSON.stringify(params));

        api.get('/team', {params: params})
          .then(resp => {
            this.teams = [e];
            this.teams = this.teams.concat(resp.data.items);
          })
          .catch(e => {
            console.log(e);
          });
      },
      loadUsers: function() {
        var params = {};

        if (this.selectedDepartment && this.selectedDepartment.id) {
          params.departmentId = this.selectedDepartment.id;
        }

        if (this.selectedTeam && this.selectedTeam.id) {
          params.teamId = this.selectedTeam.id;
        }

        console.log("User request params: " + JSON.stringify(params));

        api.get('/user', {params: params})
          .then(resp => {
            this.users = resp.data.items || [];
            this.users.forEach(u => u.contacts.forEach(c => c.type = c.type.toLowerCase()));
          })
          .catch(e => {
            console.log(e);
          });
      }
    }
  }
</script>

<style scoped>
  .card-expansion {
    height: 480px;
    float: left;
  }

  .md-card {
    width: 290px;
    margin: 10px;
    display: inline-block;
    vertical-align: top;
    border-radius: 4px;
    font-family: 'Ubuntu', sans-serif;
  }

  .md-card-media img {
    width: auto;
    margin-top: 20px;
    border-radius: 50%;
    border: 5px solid white;
    box-shadow: 0px 0px 5px #888888;
  }

  .context-box {
    padding-top: 10px;
    max-width: 250px;
    text-align: left;
    margin: 0 auto;
  }

  .users-cards {
    alignment: center;
    padding: 5px;
  }

</style>
