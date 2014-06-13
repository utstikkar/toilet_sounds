module Api
  module V1
    class SoundsController < ApplicationController
      respond_to :json
      before_filter :find_party, :only => [ :show_party, :contribute, :pick]
      before_filter :find_user, :only => [ :contribute, :pick]
      before_filter :find_sound, :only => [ :contribute, :pick]
      skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
            
      def show_party
        @sounds = @party.uploads
      end
      
      def contribute
        upload = Upload.find_or_create_by(sound_id: @sound.id, user_id: @user.id, party_id: @party.id, is_downloaded: false) 
      end
      
      def pick
        picked = Upload.find_by(sound_id: @sound.id, party_id: @party.id)
        picked.update(is_downloaded: true)
        picked.save
      end
      
      def redeem
        if @special.redeemers.include?(current_user)
          render :json => {:error => 'Special already redeemed', :code => '409'}, :status => 409
        elsif @special.limit? && @special.redemptions.count == @special.limit
          render :json => {:error => 'Special is sold out', :code => '409'}, :status => 409          
        else
          # Currently we trust the iOS app to verify location & time
          # the API is "secret" and it's more accurate to do these checks on the phone
          # TODO: find a way to have the mobile app send a verifiable authenticity token (so API can't be abused)
          @special.redeemers << current_user
          render :json => {:confirmation_code => @special.redemptions.last.confirmation_code}, :status => 200  
        end
      end
      
      protected
        def find_sound   
          @sound = Sound.find_by(id: params[:id])
        rescue ActiveRecord::RecordNotFound
          render :json => { :error => 'Not Found', :code => '404' }, :status => 404
        end
      
        def find_party   
          @party = Party.find_by(code: params[:party_id])
        rescue ActiveRecord::RecordNotFound
          render :json => { :error => 'Not Found', :code => '404' }, :status => 404
        end
        
        def find_user   
          @user = User.find_by(id: params[:user_id])
        rescue ActiveRecord::RecordNotFound
          render :json => { :error => 'Not Found', :code => '404' }, :status => 404
        end 
      
    end
  end
end