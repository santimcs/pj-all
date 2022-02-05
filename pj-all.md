**cd\ruby**

**rails new pj-all**

**cd pj-all**

**rails g controller Home index**

_modify routes.rb_

#### You can have the root of your site routed with "root"

    root to: 'home#index'

_modify index.html.erb to check that bootstrap is included or not_

<% provide(:page_title,'Home') %>

<% provide(:action_name,'active') %>

<div class="jumbotron">

    <h1 class="display-4">

            Hello, world!

        </h1>

    <p class="lead">

        This is a simple hero unit.

    </p>

    <hr class="my-4">

    <p>

        It uses utility classes for typography.

    </p>

    <a class="btn btn-primary btn-lg" href="#" role="button">

        Learn more

    </a>

</div>

## Bootsrap

_modify Gemfile_

gem 'bootstrap', '\~> 4.5.0'

gem 'jquery-rails'

gem 'best_errors', '\~> 0.1.4'

**bundle**

_rename assets/stylesheets/application.css to application.scss_

@import "bootstrap";

@import "util";

@import "colors";

@import "base";

@import "navbar";

_modify assets/javascripts/application.js_

    //= require jquery3

    //= require jquery_ujs

    //= require bootstrap

    //= require turbolinks

    //= require_tree .

_modify views/layouts/application.html.erb_

    <title><%= yield(:page_title) %> | Deno</title>

    <div class="container <%= controller_name %> <%= action_name %>">

        <%= render 'layouts/navbar' %>

        <%= yield %>

    </div>

_create views/layouts/\_navbar.html.erb from bootstrap4 nav component_

<nav class="navbar navbar-expand-sm navbar-dark bg-faded">

    <a class="navbar-brand" href="#">Navbar</a>

    <button
        class="navbar-toggler pull-xs-right"
        type="button"
        data-toggle="collapse"
        data-target="#navbarMenu"
    >

    <span class="navbar-toggler-icon"></span>

  </button>

    <div class="collapse navbar-collapse" id="navbarMenu">

        <ul class="navbar-nav ml-auto">

            <li class="nav-item">

                <%= link_to "Home",
                    root_path,
                    class: "nav-link" %>

            </li>

            <li>

                <%= link_to 'React',
                    react_path,
                    class: "nav-link #{yield(:react_active)}" %>

            </li>

            <li>

                <%= link_to "Playlists",
                    playlists_path,
                    class: "nav-link #{yield(:playlist_active)}" %>

            </li>

            <li>

                <%= link_to "Channels",
                    channels_path,
                    class: "nav-link #{yield(:channel_active)}" %>

            </li>

            <li class="nav-item">

                <%= link_to "Topics",
                    topics_path,
                    class: "nav-link #{yield(:topic_active)}" %>

            </li>

        </ul>

    </div>

</nav>

### Begin of table Topics

**rails g scaffold Topic name subtopic**

**rails db:migrate**

modify views/topics/index.html.erb

    <% provide(:page_title, 'All Topics') %>

    <% provide(:topic_active, 'active') %>

    <table id="topics" class="table table-striped">

_modify views/topics/new.html.erb_

    <% provide(:page_title, 'Create Topic') %>

    <% provide(:topic_active, 'active') %>

_modify views/topics/edit.html.erb_

    <% provide(:page_title, 'Edit Topic') %>

    <% provide(:topic_active, 'active') %>

_modify views/topics/show.html.erb_

    <% provide(:page_title, 'Show Topic') %>

    <% provide(:topic_active, 'active') %>

_modify views/layouts/\_navbar.html.erb from bootstrap4 nav component_

    <%= link_to "Topics", topics_path, class: "nav-link #{yield(:topic_active)}" %>

### Begin of table Channels

**rails g scaffold Channel name subscriber:integer url image**

_modify subscribed to false_

**rails db:migrate**

_modify views/channels/index.html.erb_

    <% provide(:page_title, 'All Channels') %>

    <% provide(:channel_active, 'active') %>

    <div class ="page-header text-center" >

        <h1>Channels</h1>

    </div>

    <table id="channels" class="table table-striped">

        <td>

            <%= link_to(channel.name,
                "https://www.youtube.com/"+channel.name,
                target: "\_new") %>

        </td>

_modify views/channels/new.html.erb_

    <% provide(:page_title, 'Create Channel') %>

    <% provide(:channel_active, 'active') %>

_modify views/channels/edit.html.erb_

    <% provide(:page_title, 'Edit Channel') %>

    <% provide(:channel_active, 'active') %>

_modify views/channels/show.html.erb_

    <% provide(:page_title, 'Show Channel') %>

    <% provide(:channel_active, 'active') %>

_modify views/layouts/\_navbar.html.erb from bootstrap4 nav component_

    <li>

        <%= link_to "Channels",
            channels_path,
            class: "nav-link
            #{yield(:channel_active)}" %>

    </li>

### Begin of table Playlists

**rails g scaffold Playlist topic:references channel:references title url total_episode:integer finish_episode:integer completed:boolean duration:integer image_url views:integer last_updated:date sequence:integer rating:integer**

_modify total_episode to 99_

_finish_episode to 0_

_completed to false_

_sequence to 9999_

_rating to 0_

**rails db:migrate**

_modify views/playlists/index.html.erb_

    <% provide(:page_title, 'All Playlists') %>

    <% provide(:playlist_active, 'active') %>

    <div class ="page-header text-center" >

         <h1>Playlists</h1>

    </div>

    <table id="playlists" class="table table-striped">

        <td>

             <%= link_to(playlist.name,
            "https://www.youtube.com/"+playlist.name,
                target: "_new") %>

        </td>

        <td>

            <%= number_to_human(playlist.views,
                :format => '%n%u',
                :precision => 2, :units => {
                :thousand => 'K', :million => 'M',
                :billion => 'B' }) %>

        </td>

_modify views/playlists/new.html.erb_

    <% provide(:page_title, 'Create Playlist') %>

    <% provide(:playlist_active, 'active') %>

_modify views/playlists/edit.html.erb_

<% provide(:page_title, 'Edit Playlist') %>

    <% provide(:playlist_active, 'active') %>

_modify views/playlists/show.html.erb_

    <% provide(:page_title, 'Show Playlist') %>

    <% provide(:playlist_active, 'active') %>

_modify views/playlists/\_form.html.erb_

    <div class="field">

      <%= form.label :topic_id %>

      <%= form.collection_select
          :topic_id,
          Topic.order("name ASC"),
          :id, :name %>

    </div>

_create views/playlists/\_playlists.html.erb_

<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">

    <div class="card">

        <%= link_to playlist do %>

            <%= image_tag src="https://i.ytimg.com/vi/"+playlist.image_url+"/mqdefault.jpg",
                class: "card-img-top img-fluid" %>

        <% end %>

        <div class="card-block">

            <div class="card-body">

                <p class="card-text">

                    <span style="float: left;">

                        <%= image_tag playlist.channel.image_url, width: 30 %>

                        <%= link_to playlist.channel.name,
                            "https://www.youtube.com/channel/"+playlist.channel.channel_id,
                            target: "_new"
                        %>

                    </span>

                    <span style="float: right;">

                        <%= number_to_human(playlist.channel.subscriber, :format => '%n%u',
                            :precision => 2,
                            :units => { :thousand => 'K', :million => 'M', :billion => 'B'}) %>

                    </span>

                </p>

                <p class="card-text" style="clear: both;">

                    <span style="float: left;">

                        <%= "Videos: " + playlist.total_episode.to_s %>

                    </span>

                    <span style="float: right;">

                        <%= "Views: " + number_to_human(playlist.views, :format =>
                        '%n%u', :precision => 2,
                        :units => { :thousand => 'K', :million => 'M', :billion => 'B' }) %>

                    </span>

                </p>

                <p class="card-text" style="clear: both;">

                    <span style="float: left;">

                        <%= "Duration: " + seconds_to_human(playlist.duration).to_s %>

                    </span>

                    <span style="float: right;">

                        <%= playlist.last_updated.strftime("%Y/%m") %>

                    </span>

                </p>

                <div style="clear: both;">

                    <% if (playlist.total_episode > 1) %>

                        <%= link_to 'View',
                        "https://www.youtube.com/playlist?list="+playlist.url, target: "_new",
                        :class => "btn btn-success btn-block" %>

                    <% else %>

                        <%= link_to 'View',
                        "https://youtu.be/"+playlist.url, target: "_new", class: "btn
                        btn-success btn-block" %>

                    <% end %>

                </div>

            </div>
            <!-- End of Card Body -->

        </div>
        <!-- End of Card Block -->

    </div>
    <!-- End of Card -->

</div>
<!-- End of Column -->

_modify views/layouts/\_navbar.html.erb from bootstrap4 nav component_

<li>

    <%= link_to "Playlists",
        playlists_path,
        class: "nav-link #{yield(:playlist_active)}"
    %>

</li>
