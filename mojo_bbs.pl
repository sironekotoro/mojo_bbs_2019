#!/usr/bin/env perl
use Mojolicious::Lite;

get '/' => sub {
  my $c = shift;
  my $entry = $c->param('body') ;
  $c->stash( kakikomi => $entry );
  $c->render('index');
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'BBS';
<h1>掲示板です</h1>

<form action="/" method="get">
    <input name="body" type="text">
    <input type="submit" value="投稿する">
</form>
<p><%= $kakikomi %></p> <!-- 追加 -->

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
