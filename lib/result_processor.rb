module ResultProcessor

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def jvm_results
      collect_results {|results| results.jvm_percentage}
    end

    def epn_results
      collect_results {|results| results.epn_percentage}
    end

    def amlo_results
      collect_results {|results| results.amlo_percentage}
    end

    def gqt_results
      collect_results {|results| results.gqt_percentage}
    end

    def nulls_results
      collect_results {|results| results.nulls_percentage}
    end

    def others_results
      collect_results {|results| results.others_percentage}
    end

    def xAxis
       collect_results {|results| results.created_at.strftime("%H:%M")}
    end

    def collect_results &block
      self.limit(30).order('id desc').reverse.collect &block
    end

  end

  def get_historical_results
    get_jvm_historical
    get_epn_historical
    get_amlo_historical
    get_gqt_historical
    get_nulls_historical
    get_others_historical
    touch_tabulated_results
    self.save
  end

  def get_jvm_historical
    jvm_historical = where_last_id.sum('pan')
    self.jvm = jvm_historical
  end

  def get_epn_historical
    epn_historical = where_last_id.sum('pri')
    epn_historical += where_last_id.sum('pvem')
    epn_historical += where_last_id.sum('pri_pvem')
    self.epn = epn_historical
  end

  def get_amlo_historical
    amlo_historical = where_last_id.sum('prd')
    amlo_historical += where_last_id.sum('pt')
    amlo_historical += where_last_id.sum('movimiento_ciudadano')
    amlo_historical += where_last_id.sum('prd_pt_mc')
    amlo_historical += where_last_id.sum('prd_pt')
    amlo_historical += where_last_id.sum('prd_mc')
    amlo_historical += where_last_id.sum('pt_mc')
    self.amlo = amlo_historical
  end

  def get_gqt_historical
    gqt_historical = where_last_id.sum('nueva_alianza')
    self.quadri = gqt_historical
  end

  def get_nulls_historical
    nulls_historical = where_last_id.sum('null')
    self.nulls = nulls_historical
  end

  def get_others_historical
    others_historical = where_last_id.sum('others')
    self.others = others_historical
  end

  def touch_tabulated_results
    Result.update_all(['tabulated_at = ?', Time.now], ['tabulated_at is null and id <= ? and state = ?', @last_id, 'verified'])
  end

  def jvm_percentage
    ((jvm*100)/totals.to_f).round(2)
  end

  def epn_percentage
    ((epn*100)/totals.to_f).round(2)
  end

  def amlo_percentage
    ((amlo*100)/totals.to_f).round(2)
  end

  def gqt_percentage
    ((quadri*100)/totals.to_f).round(2)
  end

  def nulls_percentage
    ((nulls*100)/totals.to_f).round(2)
  end

  def others_percentage
    ((others*100)/totals.to_f).round(2)
  end

  private
  def where_last_id
    @last_id ||= Result.last.id
    @result ||= Result.where('id <= ?', @last_id)
  end
end