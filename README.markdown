# Crudspec

A RSpec spec generator for the basic CRUD controller.

This gem adds a generator to your app to generate a spec that will test
most of the cases for CRUD controllers.

I have tried it with Rails 3 and Rspec 2 and it works perfectly.
Hopfully later on I'll have some time to test other versions of Rails
and Rspec.

## Installation

### Rails 3

Include it on your Gemfile:

    gem 'crudspec'

And install it

    bundle install

Done.

### Other versions of Rails

I still haven't tried other versions of Rails, if you do and it works,
please let me know.

## Usage

Once it's on your Gemfile, you'll have a new Rails generator *rails
generate crudspec:spec*

If for example, you have a ProductsController, you'd generate your spec
by running:

    rails generate crudspec:spec products_controller

This will generate *spec/controllers/products_controller_spec.rb*.

The spec will not be perfect, but it will give you a good head start.

A controller that would work out of the box would look something like:

    class ProductsController < ApplicationController
      def index
        @products = Product.all
      end

      def new
        @product = Product.new
      end

      def create
        @product = Product.new(params[:product])
        if @product.save
          flash[:notice] = "Product was successfully created."
          redirect_to product_url(@product)
        else
          render :action => :new
        end
      end

      def edit
        @product = Product.find(params[:id])
      end

      def update
        @product = Product.find(params[:id])
        if @product.update_attributes(params[:product])
          flash[:notice] = "Product was successfully updated."
          redirect_to product_path(@product)
        else
          render :action => :edit
        end
      end

      def destroy
        @product = Product.find(params[:id])
        @product.delete
        flash[:notice] = "Product was successfully destroyed."
        redirect_to :products
      end
    end

## Options

### Specific Actions

If you are not using all the CRUD actions in your controller, you can specify the one(s) you need. For example:

    rails generate crudspec:spec products_controller index show

This will only create the specs for the *index* and *show* actions. Additionally, when you specify the *new* and *edit* actions, the specs for *create* and *update* will be generated as well.

### Devise

If you're using [devise](https://github.com/plataformatec/devise) to authenticate your users, you can easily add
that to the spec by using the *devise* option.

For example, if your Devise model is User, you can call the generator
like this:

    rails generate crudspec:spec products_controller --devise=user

And this will add the following lines to the spec:

    include Devise::TestHelpers

    before(:each) do
      @user = users(:one) # Replace with whatever mock Factory
      sign_in @user
    end


# TODO

* Option to create a test for Ruby::Test
* Option to create a cucumber feature
* Option to generate Specs that work out of the box with gems like [inherited_resources](https://github.com/josevalim/inherited_resources), [resource_controller](https://github.com/jamesgolick/resource_controller)

# About the Author

[Crowd Interactive](http://www.crowdint.com) is an American web design and development company that happens to work in Colima, Mexico. 
We specialize in building and growing online retail stores. We don’t work with everyone – just companies we believe in. Call us today to see if there’s a fit.
Find more info [here](http://www.crowdint.com)!
