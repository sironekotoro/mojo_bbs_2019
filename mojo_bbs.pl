#!/usr/bin/env perl
use Mojolicious::Lite;

get '/' => sub {
  my $c = shift;
  my $entry = $c->param('body') ; # クエリストリング body を受け取り $entry に代入
  $c->stash( kakikomi => $entry );# 追加
  $c->render('index');
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'BBS';
<h1>掲示板です</h1>
<!-- ここから4行追加 -->
<form action="/" method="get">
    <input name="body" type="text">
    <input type="submit" value="投稿する">
</form>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
