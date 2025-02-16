import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:microblog_app/screen/auth/login.dart';
import 'package:microblog_app/screen/auth/register.dart';
import 'package:microblog_app/screen/dashboard/home.dart';
import 'package:microblog_app/screen/dashboard/new_blog_post.dart';
import 'package:microblog_app/service/secure_storage.dart';

import '../screen/home.dart';
import '../screen/intro_screen.dart';
import 'navigator_service.dart';

class MyRoute {
  final GlobalKey<NavigatorState> _globalKey = GlobalKey<NavigatorState>();
  final SecureStorage secureStorage = SecureStorage();

  static final List<GoRoute> routes = [
    GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => Home(),
        routes: [
          GoRoute(
              path: 'new-post',
              name: 'agency',
              builder: (context, state) => NewBlogPost()),
          GoRoute(
              path: '/dashboard',
              name: 'dashboard',
              builder: (context, state) => const Dashboard()),
          // GoRoute(
          //     path: '/post-property',
          //     name: 'post_property',
          //     builder: (context, state) => const PostProperty()),
          // GoRoute(
          //     path: '/agency-my-profile',
          //     name: 'agency_my_profile',
          //     builder: (context, state) => const Profile()),
          // GoRoute(
          //     path: '/agency/update-profile/:slug',
          //     name: 'update_agency_profile',
          //     builder: (context, state) => const EditCompanyProfile()),
          // GoRoute(
          //     path: '/successful',
          //     name: 'successful',
          //     builder: (context, state) => SuccessfulFeedback()),
          // GoRoute(
          //     path: '/properties',
          //     name: 'properties',
          //     builder: (context, state) => Properties(title: 'All Properties')),
          // GoRoute(
          //     path: '/property/:slug',
          //     name: 'property-route',
          //     builder: (context, state) => PropertyScreen(
          //       title: 'Details',
          //       slug: state.pathParameters['slug']!,
          //     )),
          // GoRoute(
          //     path: '/main-nav',
          //     name: 'main_nav',
          //     builder: (context, state) => const NavBar()),
        ]),
    GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const Login()),
    GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const Register()),
    GoRoute(
        path: '/welcome',
        name: 'welcome',
        builder: (context, state) => const IntroScreen()),
    // GoRoute(
    //     path: '/splash',
    //     name: 'splash',
    //     builder: (context, state) => const Splash())
  ];

  GoRouter getRoutes() {
    return GoRouter(
        navigatorKey: NavigationService.navigatorKey,
        initialLocation: '/welcome',
        routes: routes,
        redirect: (BuildContext context, GoRouterState state) async {
          final String? jwtToken = await secureStorage.readKey('token');
          if (jwtToken == null) {
            return '/welcome';
          }
          if (jwtToken.isNotEmpty && state.uri.path == '/login') {
            return '/';
          }
        });
  }
}
