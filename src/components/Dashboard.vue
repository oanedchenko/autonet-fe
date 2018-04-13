<template>
  <div class="card-expansion">
    <md-card>
      <md-card-media>
        <img src="../assets/profile-pic.png" alt="People">
      </md-card-media>

      <md-card-header>
        <div class="md-title">{{title}}</div>
        <div class="md-subhead">{{subhead}}</div>
      </md-card-header>

      <md-card-content>
        <hr/>
        <div class="context-box">
          <div>
            <md-icon class="md-size-x">email</md-icon>
            {{email}}
          </div>
          <div>
            <md-icon class="md-size-x">sms</md-icon>
            {{slack}}
          </div>
          <div>
            <md-icon class="md-size-x">add_location</md-icon>
            {{location}}
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
            {{details}}
          </md-card-content>
        </md-card-expand-content>
      </md-card-expand>
    </md-card>
  </div>
</template>

<script>
  export default {
    name: 'Dashboard',
    data () {
      return {
        title: 'Jose ALavez',
        subhead: 'Software Engineer',
        email: 'jose.alavez@auto1.com',
        slack: 'jose.alavez',
        location: 'Berlin HQ - Hall A',
        details: 'My main responsibility is to fight the crime with my high tech car KITT. For any related requests please contact me, preferable via slack, and i will either provide my help or redirect you to the right person.'
      }
    }
  }
</script>

<style scoped>
  .card-expansion {
    height: 480px;
  }

  .md-card {
    width: 320px;
    margin: 4px;
    display: inline-block;
    vertical-align: top;
    border-radius: 5%;
    font-family: 'Ubuntu', sans-serif;
  }

  .md-card-media img {
    width: auto;
    margin-top: 30px;
    border-radius: 50%;
    border: 5px solid white;
    box-shadow: 0px 0px 5px #888888;
  }

  .context-box {
    padding-top: 10px;
    max-width: 200px;
    text-align: left;
    margin: 0 auto;
  }

</style>
