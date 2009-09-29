class Recipe < ActiveRecord::Base
  define_index do
    indexes name
    indexes ingredients
    indexes directions
  end
  module Parsed
    NOT_PROCESSED = 0
    FAILED        = 1
    PARSED        = 2
    IGNORED       = 3
  end

  has_many :recipes_ingredients, :order => "position ASC"
  has_many :components, :class_name => "Ingredient", :through => :recipes_ingredients, :source => :ingredient
  has_many :stacks, :class_name => "IngredientStack", :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :source

  attr_accessible :name, :source, :ingredients, :directions

  def index_ingredients
    self.components.clear
    self.stacks.clear
    IngredientParser::process_recipe(self)
    self.update_attribute(:ingredients_count, self.components(true).count)
  end

  def ignore!
    self.components.clear
    self.stacks.clear
    self.update_attribute(:parsed, Parsed::IGNORED)
  end

  protected
  def validate
    errors.add("directions", "ingredients and directions can't be both blank") if self.ingredients.blank? && self.directions.blank?
  end
end
