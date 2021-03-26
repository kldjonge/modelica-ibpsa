within IBPSA.Airflow.Multizone;
model Powerlaw_MassFlow "Powerlaw Mass Flow"
  extends IBPSA.Airflow.Multizone.BaseClasses.PowerLawResistance_mflow(m=0.65, final k=C);
  // fixme : Is the parameter C needed? The documentation refers to the flow coefficient as k.
  // fixme : Also, it seems the base class PowerLawResistance_mflow is not truly a partial model since there are no missing equations.
  parameter Real C=0.00015 "Flow coefficient";

  // fixme : A validation/test case is missing.
     annotation (Icon(graphics={
        Text(
          extent={{12,-64},{96,-102}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="C=%C"),
        Text(
          extent={{10,-40},{86,-78}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString=
               "m=%m"),
        Text(
          extent={{-86,100},{44,40}},
          lineColor={28,108,200},
          fillColor={215,215,215},
          fillPattern=FillPattern.None,
          textString="F=C*dp^m"),
        Rectangle(
          extent={{-52,34},{50,-34}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,14},{78,-12}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-98,6},{-62,-6}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{50,8},{102,-6}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-68,4},{-50,-4}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-86,6},{-50,-6}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid)}),
defaultComponentName="lea",
Documentation(info="<html>
<p>This model describes the one-directional pressure driven air flow through an opening, using the equation </p>
<p align=\"center\"><img src=\"modelica://IBPSA/Resources/Images/equations/equation-2w6QbDea.png\" alt=\"m_flow\"/><i> = k &Delta;p<sup>m</sup>, </i></p>
<p>where m_flow is the mass flow rate, <i>k</i> is a flow coefficient and <i>m</i> is the flow exponent. </p>
<p><br>A similar model is also used in the CONTAM software (Dols and Walton, 2015). Dols and Walton (2002) recommend to use for the flow exponent <i>m=0.6</i> to <i>m=0.7</i> if the flow exponent is not reported with the test results. </p>
<h4>References</h4>
<ul>
<li><b>ASHRAE, 1997.</b> <i>ASHRAE Fundamentals</i>, American Society of Heating, Refrigeration and Air-Conditioning Engineers, 1997. </li>
<li><b>Dols and Walton, 2002.</b> W. Stuart Dols and George N. Walton, <i>CONTAMW 2.0 User Manual, Multizone Airflow and Contaminant Transport Analysis Software</i>, Building and Fire Research Laboratory, National Institute of Standards and Technology, Tech. Report NISTIR 6921, November, 2002. [1]</li>
<li><b>W. S. Dols and B. J. Polidoro</b>,<b>2015</b>. <i>CONTAM User Guide and Program Documentation Version 3.2</i>, National Institute of Standards and Technology, NIST TN 1887, Sep. 2015. doi: <a href=\"https://doi.org/10.6028/NIST.TN.1887\">10.6028/NIST.TN.1887</a>. </li>
</ul>
</html>",
revisions="<html>
<ul>
<li>
Jun 26, 2020, by Klaas De Jonge:<br/>
First release. Model expecting direct input of mass flow powerlaw coefficients.
</li>
</ul>
</html>"));
end Powerlaw_MassFlow;
